class DosesController < ApplicationController

  before_action :load_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    ingredient = Ingredient.find(dose_params[:ingredient_id])
    @dose.description = "#{dose_params[:description]} of #{ingredient.name}"
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :ingredient)
  end

  def load_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
