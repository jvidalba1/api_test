require "rails_helper"

RSpec.describe Product, :type => :model do
  context "validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_numericality_of :price }
    it { should belong_to(:category) }

    it "has a valid factory" do
      expect(FactoryGirl.build(:product)).to be_valid
    end

    it 'should be invalid without name' do 
      expect(FactoryGirl.build(:product, name: "")).to be_invalid
    end
  end

  context "class methods #suggestions" do 
    before do 
      @c1 = FactoryGirl.create(:category)
      @c2 = FactoryGirl.create(:category)
      @product1 = FactoryGirl.create(:product, name: "Cellphone Samsung", category: @c1)
      @product2 = FactoryGirl.create(:product, name: "Cellphone Apple", category: @c1)
      @product3 = FactoryGirl.create(:product, name: "TV Plasma", category: @c1)
      @product4 = FactoryGirl.create(:product, name: "Sushi", category: @c2)
    end

    it 'should return products matched by name' do 
      products = Product.suggestions("Cellphone")
      expect(products).to include(@product1, @product2)
    end

    it 'should return products matched by name & category' do 
      products = Product.suggestions("s", @c2.id)
      expect(products).to include(@product4)
      expect(products).not_to include(@product1, @product2, @product3)
    end
  end
end
