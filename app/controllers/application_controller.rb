require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes' do
    @recipes = Recipe.all
    erb :index 
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end 

  post '/recipes' do
   # binding.pry
    @recipe = Recipe.create(name:params[:name],ingredients:params[:ingredients],cook_time:params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do  
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.title = params[:title]
    @recipe.content = params[:content]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end 

  delete '/recipes/:id' do
   # binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end 
 

end
