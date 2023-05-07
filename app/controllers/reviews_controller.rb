class ReviewsController < ApplicationController
  def destroy
    Review.find(params[:id]).destroy

    flash[:notice] = 'Review was destroyed'

    redirect_to reviews_homepages_path
  end

  def new; end

  def create
    Review.create(review_params)

    flash[:notice] = 'Review was created'

    redirect_to reviews_homepages_path
  end

  def update
    review = Review.find(params[:id])

    review.update(review_params)

    flash[:notice] = 'Review was updated'

    redirect_to reviews_homepages_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(Review.column_names.map(&:to_sym))
  end
end
