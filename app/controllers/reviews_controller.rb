class ReviewsController < ApplicationController
	before_action :current_user
	def create
		product = Product.find params[:product_id]
		@review = Review.create({user_id: current_user.id, product_id: product.id, rating: review_params[:rating], description: review_params[:description]})
		redirect_to product
	end

	def destroy
		# product reidentified for redirect
		@product = Product.find(params[:product_id])
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to @product
	end

	private

	def review_params
		params.require(:review).permit(
			:description,
			:rating
			)
	end
end