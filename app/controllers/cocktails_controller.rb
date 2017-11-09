class CocktailsController < ApplicationController

  #Get info to show all cocktails
  def index
    @cocktails = Cocktail.all
  end

  #Create an empty new cocktail and go to page with form
  def new
    @cocktail = Cocktail.new
  end

  #Save all the form data in the cocktail, save it to database
  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  def edit
  end

  #Grab single cocktail to show all details on page. Go to page
  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
