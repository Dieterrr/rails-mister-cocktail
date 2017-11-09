class DosesController < ApplicationController
  def index
    # Maybe add cocktails?
    @doses = Dose.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new

    @ingredients = Ingredient.all
    @ingredients_array = []
    @ingredients.each do |i|
      @ingredients_array << i #also need the id of ingredient
    end

  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    #Here we save the id of the cocktail to the dose
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_doses_path(@cocktail, @dose)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
