class DosesController < ApplicationController
# Index and show are always together.
# Index is all of the objects
# Show is a single object displayed on a page

def index
  @doses = Dose.all
  @cocktail = Cocktail.find(params[:cocktail_id])
end

def show
  @dose = Dose.find(params[:id])
end

# Create and New are always together.
# New is the page that gets called where you create
# a new object.
# Create is the method that is called when you submit
# the form on the new page.

def create
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.new(dose_params)
  @dose.cocktail = Cocktail.find(params[:cocktail_id])
  @dose.save
  redirect_to cocktail_path(@cocktail)
end

def new
  @cocktail = Cocktail.find(params[:cocktail_id])
  @ingredients = Ingredient.all
  @dose = Dose.new
end

def dose_params
  params.require(:dose).permit(:description, :ingredient_id)
end

end
