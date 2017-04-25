# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  categories = Category.create([
    { en: 'Technology', es: 'Tecnologia' }, 
    { en: 'Personal care', es: 'Cuidado personal' }, 
    { en: 'Comida', es: 'Food' }
  ])
  Product.create(name: 'Cellphone', price: 710.00, image: "url_image_cellphone", category: categories.first)
  Product.create(name: 'TV plasma', price: 755.50, image: "url_image_tv", category: categories.first)
  Product.create(name: 'Shampoo dark hair', price: 25.50, image: "url_image_shampoo", category: categories.second)
  Product.create(name: 'Pasta', price: 13.00,  image: "url_image_pasta", category: categories.third)
  Product.create(name: 'Bacon junk food', price: 21.50,  image: "url_image_bacon", category: categories.third)
  Product.create(name: 'Bread with pasas', price: 17.00,  image: "url_image_bread", category: categories.third)
