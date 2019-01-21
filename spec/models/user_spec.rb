require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
  	it 'should create a valid user' do
  		@user = User.create(email: "test@test.com", 
  			first_name: "test", 
  			last_name: "test", 
  			password: "test", 
  			password: "test"
  		)
  		expect(@user).to be_valid
  		puts @user.errors.full_messages
   	end

   	it 'should be invalid with mismatched password fields' do 
   		@user = User.create(email: "test@test.com", 
   			first_name: "test", 
   			last_name: "test", 
   			password: "testtest", 
   			password_confirmation: "test"
   		)
   		expect(@user).to be_invalid
   		puts @user.errors.full_messages
   	end

   	it 'should be invalid with non-unique (inc. case sensitive) emails' do
   		@user = User.create(email: "test@test.com", 
   			first_name: "test", 
   			last_name: "test", 
   			password: "test", 
   			password_confirmation: "test"
   		)
   		@user2 = User.create(email: "TEST@test.com", 
   			first_name: "test", 
   			last_name: "test", 
   			password: "test", 
   			password_confirmation: "test"
   		)
   		expect(@user2).to be_invalid
   		puts @user2.errors.full_messages
   	end

   	it 'should be invalid without a first name' do 
   		@user = User.create(email: "test@test.com", 
   			first_name: nil, 
   			last_name: "test", 
   			password: "test", 
   			password_confirmation: "test"
   		)
   		expect(@user).to be_invalid
   		puts @user.errors.full_messages
  	end   	

  	it 'should be invalid without a last name' do 
   		@user = User.create(email: "test@test.com", 
   			first_name: "test", 
   			last_name: nil, 
   			password: "test", 
   			password_confirmation: "test"
   		)
   		expect(@user).to be_invalid
   		puts @user.errors.full_messages
  	end   	

  	it 'should be invalid without an email' do 
   		@user = User.create(email: nil, 
   			first_name: "test", 
   			last_name: "test", 
   			password: "test", 
   			password_confirmation: "test"
   		)
   		expect(@user).to be_invalid
   		puts @user.errors.full_messages
  	end
  end

  describe '.authenticate_with_credentials' do
  	it 'should return user object if email/password is correct' do 
   		@user = User.create(email: 'test@test.com', 
   			first_name: "test", 
   			last_name: "test", 
   			password: "test1234", 
   			password_confirmation: "test1234"
   		)
  		user = User.authenticate_with_credentials('test@test.com', 'test1234')
  		expect(user).to eql(@user)
  	end

  	it 'should return nil when email is correct, password incorrect' do
  		@user = User.create(email: 'test@test.com',
	  		first_name: "test",
	  		last_name: "test",
	  		password: "test1234",
	  		password_confirmation: "test1234"
	  	)
  		user = User.authenticate_with_credentials('test@test.com', 'wrongpassword')
  		expect(user).to eql(nil)
  	end

  	it 'should return nil when email is incorrect, password correct' do
  		@user = User.create(email: 'test@test.com',
	  		first_name: "test", 
	  		last_name: "test", 
	  		password: "test1234", 
	  		password_confirmation: "test1234"
	  	)
  		user = User.authenticate_with_credentials('wrong@email.com', 'test1234')
  		expect(user).to eql(nil)
  	end

  	it 'should return user object if email contains leading/trailing spaces' do
  		@user = User.create(email: 'test@test.com', 
  			first_name: "test", 
  			last_name: "test", 
  			password: "test1234", 
  			password_confirmation: "test1234"
  		)
  		user = User.authenticate_with_credentials('  test@test.com  ', 'test1234')
  		expect(user).to eql(@user)
  	end

  	it 'should return nil if email contains spaces within' do
  		@user = User.create(email: 'test@test.com', 
  			first_name: "test", 
  			last_name: "test", 
  			password: "test1234", 
  			password_confirmation: "test1234"
  		)
  		user = User.authenticate_with_credentials('tes t@ test .com', 'test1234')
  		expect(user).to eql(nil)
  	end

  	it 'should return user object if email is wrong case' do
  		@user = User.create(email: 'test@test.com', 
  			first_name: "test", 
  			last_name: "test", 
  			password: "test1234", 
  			password_confirmation: "test1234"
  		)
  		user = User.authenticate_with_credentials('TEST@TEST.COM', 'test1234')
  		expect(user).to eql(@user)
  	end
  end
end	
