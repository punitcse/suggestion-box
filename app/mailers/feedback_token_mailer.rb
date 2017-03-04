class FeedbackTokenMailer < ApplicationMailer
  def feedback_token_email(person, topic, feedback_token)
    @person = person
    @feedback_token = feedback_token
    @topic = topic
    mail(to: person.email, subject: 'Feedback verification uniq token')
  end
end
