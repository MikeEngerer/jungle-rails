class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    # retrieve all reviews for specific product
    @reviews = Review.where(product_id: @product.id).order(created_at: :desc)
  end 

  # def average_rating

  #   if Review.where(product_id: @product.id).length > 0
  #     product_reviews = Review.where(product_id: p.id)
  #     sum = 0
  #     product_reviews.each do |r|
  #       sum += r.rating
  #     end
  #   #   if @product_reviews.length > 0
  #     @avg_rating = sum.to_f / product_reviews.length
  #   else
  #     @avg_rating = "No ratings yet!"
  #   end
  # @avg_rating
  # end
end
