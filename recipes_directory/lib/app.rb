require_relative 'recipes_directory'

DatabaseConnection.connect('recipes_directory')

recipes = RecipeRepository.new

recipes.all.each do |recipe|
  puts "#{recipe.name}, #{recipe.cook_time}"
end

puts recipes.find(2).rating




