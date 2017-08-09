require 'rails_helper'

RSpec.describe ProductsController, type: :controller do 
  render_views

  describe "GET #suggestions" do 

    it 'responds successfully with an HTTP 200 status code' do 
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    
    let(:json) { JSON.parse(response.body) }

    before do
      @c1 = FactoryGirl.create(:category)
      @c2 = FactoryGirl.create(:category)
      @product1 = FactoryGirl.create(:product, name: "Cellphone Samsung", category: @c1, price: 450.0)
      @product2 = FactoryGirl.create(:product, name: "Cellphone Apple", category: @c1, price: 650.99)
      @product3 = FactoryGirl.create(:product, name: "TV Plasma", category: @c1, price: 150.0)
      @product4 = FactoryGirl.create(:product, name: "Sushi", category: @c2)
    end

    context 'all products' do
      it 'returns the suggestions' do
        get :suggestions, format: :json
        expect(json["suggestions"].collect { |p| p["name"] }).to include(@product1.name, @product2.name)
      end
    end

    context 'all suggested products with name and category filter given' do 
      it 'return the suggestions' do 
        get :suggestions, format: :json, params: { q: "TV", cat: @c1.id }
        expect(json["suggestions"].collect { |p| p["name"] }).to include(@product3.name)
        expect(json["suggestions"].collect { |p| p["name"] }).not_to include(@product1.name, @product2.name, @product4.name)
      end
    end 

    context 'all suggested products with name, category and price filters given' do 
      it 'return the suggestions' do 
        get :suggestions, format: :json, params: { q: "", cat: "#{@c1.id}", minprice: "500.0", maxprice: "700.0" }
        expect(json["suggestions"].collect { |p| p["name"] }).to include(@product2.name)
        expect(json["suggestions"].collect { |p| p["name"] }).not_to include(@product1.name, @product3.name, @product4.name)
      end
    end 
  end
end
