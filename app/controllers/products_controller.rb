class ProductsController < ApplicationController
  def suggestions
    @products = Product.suggestions(
      suggestion_params[:q], 
      suggestion_params[:cat], 
      suggestion_params[:minprice], 
      suggestion_params[:maxprice]
    )
  end

  private 
  
  def suggestion_params
    params.permit(:q, :minprice, :maxprice, :cat)
  end
end
