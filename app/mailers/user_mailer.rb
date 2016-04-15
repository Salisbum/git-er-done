class UserMailer < ApplicationMailer
  default from: "landsnarkr@gmail.com"

  def new_review_notification_email(user, landmark, review)
    @user = user
    @landmark = landmark
    @review = review
    @url = 'http://landsnarkr.herokuapp.com/'
    mail(to: @user.email, subject: "A New Review Has Been Submitted")
  end
end
