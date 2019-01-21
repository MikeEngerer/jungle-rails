require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
  	it 'should create a valid user' do
  		@user = User.create(email: "test@test.com", first_name: "test", last_name: "test", password: "test", password: "test")
  		expect(@user).to be_valid
  		puts @user.errors.full_messages
   	end

   	it 'should be invalid with mismatched password fields' do 
   		@user = User.create(email: "test@test.com", first_name: "test", last_name: "test", password: "testtest", password_confirmation: "test")
   		expect(@user).to be_invalid
   		puts @user.errors.full_messages
   	end

   	it 'should be invalid with non-unique (inc. case sensitive) emails' do
   		@user = User.create(email: "test@test.com", first_name: "test", last_name: "test", password: "test", password_confirmation: "test")
   		@user2 = User.create(email: "TEST@test.com", first_name: "test", last_name: "test", password: "test", password_confirmation: "test")
   		expect(@user2).to be_invalid
   		puts @user2.errors.full_messages
   	end

   	it 'should be invalid without a first name' do 
   		@user = User.create(email: "test@test.com", first_name: nil, last_name: "test", password: "test", password_confirmation: "test")
   		expect(@user).to be_invalid
   		puts @user.errors.full_messages
  	end   	

  	it 'should be invalid without a last name' do 
   		@user = User.create(email: "test@test.com", first_name: "test", last_name: nil, password: "test", password_confirmation: "test")
   		expect(@user).to be_invalid
   		puts @user.errors.full_messages
  	end   	

  	it 'should be invalid without an email' do 
   		@user = User.create(email: nil, first_name: "test", last_name: "test", password: "test", password_confirmation: "test")
   		expect(@user).to be_invalid
   		puts @user.errors.full_messages
  	end
  end

  describe '.authenticate_with_credentials' do
  	it 'should return user object if password is correct' do 

end	
