# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :decimal(, )
#  image       :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :price, numericality: true

  def self.suggestions(name, category=nil, min_price=nil, max_price=nil)
    products = Product.includes(:category).where("name LIKE '%#{name}%'").to_a
    products = products.select { |p| p.category_id == category.to_i } unless category.nil?
    products = products.select { |p| p.price <= max_price.to_f && p.price >= min_price.to_f } unless (max_price.nil? || min_price.nil?)
    products
  end
end
