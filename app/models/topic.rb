class Topic < ApplicationRecord
  has_many :questions
  has_many :feedback_identifiers
  belongs_to :person, class_name: 'CoreBox::Person'

  accepts_nested_attributes_for :questions

  after_create :send_feedback_identifier

  def self.retrieve_topic_details(params)
    if params[:with_question] && params[:with_answers]
      Topic.all.as_json(include: { questions: { include: :answers}})
    elsif params[:with_question]
      Topic.all.as_json(include: :questions)
    else
      Topic.all.as_json
    end
  end

  private

  def send_feedback_identifier
    CoreBox::Person.all.each do |person|
      feedback_token = SecureRandom.hex
      FeedbackTokenMailer.feedback_token_email(person, feedback_token)
    end
  end
end
