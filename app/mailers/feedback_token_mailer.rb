class FeedbackTokenMailer < ApplicationMailer
  def feedback_token_email(person, feedback_token)
    @person = person
    @feedback_token = feedback_token
    mail(to: "namrataukirde@gmail.com", subject: 'Feedback verification uniq token') do |format|
      format.text { render plain: feedback_token }
    end
  end
end
