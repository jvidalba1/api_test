class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).where("name LIKE '%#{suggestion_params[:q]}%'")
    
  end

  private 
  
  def suggestion_params
    params.permit(:q, :minprice, :maxprice)
  end
end
