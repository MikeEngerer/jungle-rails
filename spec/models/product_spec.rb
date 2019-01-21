require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  	it 'should create a valid product within cat1' do
  		@cat1 = Category.create(name: "test-category")
  		@product1 = Product.create(name: "prod1", category_id: @cat1.id, price_cents: 1000, quantity: 100)
  		expect(@product1).to be_valid
  	end
  	it 'should be invalid due to absence of name' do
  		@cat1 = Category.create(name: "test-category")
  		@product1 = Product.create(name: nil, category_id: @cat1.id, price_cents: 1000, quantity: 100)
  		expect(@product1).to be_invalid
  	end
  	it 'should be invalid due to absence of category_id' do
  		@product1 = Product.create(name: "prod1", category_id: nil, price_cents: 1000, quantity: 100)
  		expect(@product1).to be_invalid
  	end
   	it 'should be invalid due to absence of quantity' do
  		@cat1 = Category.create(name: "test-category")
  		@product1 = Product.create(name: "prod1", category_id: @cat1.id, price_cents: 1000, quantity: nil)
  		expect(@product1).to be_invalid
  	end
  	it 'should be invalid due to absence of price' do
 		@cat1 = Category.create(name: "test-category")
  		@product1 = Product.create(name: "prod1", category_id: @cat1.id, price_cents: nil, quantity: 100)
  		expect(@product1).to be_invalid
  	end
  end
end
