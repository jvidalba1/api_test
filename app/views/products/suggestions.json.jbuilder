json.suggestions @products do |product|
  json.name product.name
  json.image product.image
  json.price product.price
  json.category do
    json.id product.category.try(:id)
    json.trans do
      json.en product.category.try(:en)
      json.es product.category.try(:es)
    end
  end
end
