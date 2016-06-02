class CocktailsController < ApplicationController

# Index and show are always together.
# Index is all of the objects
# Show is a single object displayed on a page

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

# Create and New are always together.
# New is the page that gets called where you create
# a new object.
# Create is the method that is called when you submit
# the form on the new page.

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to new_cocktail_dose_path(@cocktail)
  end

  def new
    @cocktail = Cocktail.new
  end

# The Edit and Update page are always together.
# The edit is the page that is being displayed.
# The Update method is whats being called when
# submitting the page.

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

# Single option destroy which has no partner inside the controller.

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
