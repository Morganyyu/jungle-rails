class ReviewsController < ApplicationController

  def show
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.save
    redirect_to product_path(@product)
  end

  def destroy
    # TODO: ensure that only the right user can do this
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.user = current_user
    @review.destroy
    redirect_to product_path(@product)
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end
end
