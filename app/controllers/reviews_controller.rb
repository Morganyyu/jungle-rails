class ReviewsController < ApplicationController
  scope :desc, order("reviews.review_at DESC")
  def show
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)

    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end
end
