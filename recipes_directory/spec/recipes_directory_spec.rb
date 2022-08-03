
require 'recipes'
require 'recipes_directory'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
  connection.exec(seed_sql)
end

RSpec.describe RecipeRepository do

  before(:each) do 
    reset_recipes_table
  end


  it "returns all recipes" do
    repo = RecipeRepository.new

    recipes = repo.all

    expect(recipes.length).to eq(2)

    expect(recipes[0].id).to eq('1')
    expect(recipes[0].name).to eq('Osso Bucco') 
    expect(recipes[0].cook_time).to eq('240') 
    expect(recipes[0].rating).to eq('3')


    expect(recipes[1].id).to eq('2')
    expect(recipes[1].name).to eq('Jian Bing') 
    expect(recipes[1].cook_time).to eq('4') 
    expect(recipes[1].rating).to eq('3') 
  end

  it "finds a recipe" do
    repo = RecipeRepository.new

    recipe = repo.find(1)

    expect(recipe.id).to eq('1')
    expect(recipe.name).to eq('Osso Bucco') 
    expect(recipe.cook_time).to eq('240') 
    expect(recipe.rating).to eq('3')

  end
end