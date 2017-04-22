class ProductsController < ApplicationController
  def index
    @products = if suggestion_params[:cat] 
      @products = Product.joins(:category).where("categories.es LIKE '%#{suggestion_params[:cat]}%'")
      @products.where("name LIKE '%#{suggestion_params[:q]}%'")
    else
      Product.where("name LIKE '%#{suggestion_params[:q]}%'")
    end

    if suggestion_params[:maxprice].present? && suggestion_params[:minprice].present?
      @products = @products.where("(price <= #{suggestion_params[:maxprice]}) AND (price >= #{suggestion_params[:minprice]})")
    end
  end

  private 
  
  def suggestion_params
    params.permit(:q, :minprice, :maxprice, :cat)
  end
end
