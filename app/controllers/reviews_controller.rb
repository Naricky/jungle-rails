class ReviewsController < ApplicationController

 before_action :require_login

  def create
   @product = Product.find(params[:product_id])
   review = @product.reviews.create(review_params)
   review.user_id = current_user.id

    if review.save
      redirect_to @product
    else
      render '/products'
    end

  end

 def review_params
   params.require(:review).permit(
       :description,
       :rating,
   )

  end

 def destroy
   review = Review.find(params[:id])
   if review.user_id == current_user.id
     review.destroy!
   end
   redirect_to product_path(params[:product_id])
 end


  private

  def require_login
    unless current_user

      redirect_to new_login_url # change here
    end
  end
end
