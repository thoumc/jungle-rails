class ReviewsController < ApplicationController


  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user = current_user
    @review.save!
    redirect_to product_path(@product)

  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@product), notice: 'Review deleted!'
  end

  private
  def review_params
    params.require(:review).permit(
      :product_id,
      :description,
      :rating)
  end
end
