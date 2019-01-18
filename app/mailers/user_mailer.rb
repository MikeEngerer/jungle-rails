class UserMailer < ApplicationMailer
	default from: 'no-reply@jungle.com'

	def order_email(user)
		@user = user
		@url = [:orders]
		mail(to: @user.email, subject: 'Order placed!')
	end

end
