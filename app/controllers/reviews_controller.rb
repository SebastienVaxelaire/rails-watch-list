class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list
    @reviews = Review.where(list: @list)
    if @review.save
      redirect_to list_path(@review.list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :list_id)
  end
end
