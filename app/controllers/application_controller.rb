
class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

 
  get '/recipes/new' do #loads new form
    erb :new
  end

  get '/recipes' do #loads index page
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do  #loads show page
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end


  post '/recipes' do  #creates a recipe
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end


  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end
 
  patch '/recipes/:id' do  #updates a recipe
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end



  # code actions here!

end





 


