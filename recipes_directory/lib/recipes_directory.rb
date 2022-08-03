require_relative 'recipes'

class RecipeRepository

  def all

    sql = 'SELECT * FROM recipes;'
    pg_recipes = DatabaseConnection.exec_params(sql, [])

    recipes = []

    pg_recipes.each do |entry|

      recipe = Recipe.new
      recipe.id = entry['id']
      recipe.name = entry['name']
      recipe.cook_time = entry['cook_time']
      recipe.rating = entry['rating']

      recipes << recipe
    end

    recipes
    # Returns an array of Student objects.
  end

  def find(id)

    sql = 'SELECT * FROM recipes WHERE id = $1;'
    sql_params = [id]
    pg_recipes = DatabaseConnection.exec_params(sql, sql_params)
    
    entry = pg_recipes[0]

    recipe = Recipe.new
    recipe.id = entry['id'] 
    recipe.name = entry['name']
    recipe.cook_time = entry['cook_time']
    recipe.rating = entry['rating']

    recipe
  end
end