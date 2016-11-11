class ReviewsController < ApplicationController

  before_action :load_cocktail, only: [:create]

  def create
    @review = @cocktail.reviews.new(review_params)
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def index
  end

  def new
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:description, :cocktail_id)
  end

  def load_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end


