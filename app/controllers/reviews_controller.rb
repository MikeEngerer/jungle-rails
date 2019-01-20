class ReviewsController < ApplicationController
	def create
		user = current_user.id
		product = Product.find params[:product_id]
		@review = Review.create({user_id: user, product_id: product.id, rating: review_params[:rating], description: review_params[:description]})
		redirect_to product
	end

	private

	def review_params
		params.require(:review).permit(
			:id,
			:description,
			:rating,
			)
	end
end