class UserMailer < ApplicationMailer

	def welcome_email(user)
		@user = user
		attachments["image.png"]= File.read("/home/shrikanth/image.png")
		attachments.inline["image1.png"]= File.read("/home/shrikanth/image.png")

		mail(to: @user.email,subject: "welcome_email")

	end
end
