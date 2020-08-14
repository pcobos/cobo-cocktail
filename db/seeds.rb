require "json"
require "open-uri"

ingredients_url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
serialized_ingredients = open(ingredients_url).read
ingredients = JSON.parse(serialized_ingredients)

ingredient_list = []

ingredients["drinks"].map do |ingredient|
  ingredient_list << ingredient["strIngredient1"]
end

Ingredient.destroy_all
puts "> Creating ingredients"

30.times do
  Ingredient.create(name: ingredient_list.sample)
end

puts "> Done!"

