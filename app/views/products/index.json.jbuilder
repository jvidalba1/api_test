json.suggestions @products do |product|
  json.name product.name
  json.image product.image
  json.price product.price
  json.category do
    json.id product.category.id
    json.trans do
      json.en product.category.en
      json.es product.category.es
    end
  end
end
