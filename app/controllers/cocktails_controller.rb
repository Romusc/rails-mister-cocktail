class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:destroy, :show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @review = Review.new
    @ingredients
    @reviews = @cocktail.reviews.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end

  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end

end
