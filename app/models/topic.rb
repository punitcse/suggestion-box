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

  def graph_details
    points = partition_points
    default_hash = {sad: 0, neutral: 0, happy: 0}
    details = questions.question_type_ratings.includes(:answers).each_with_object(default_hash) do |question, hash|
      question.answers.each do |answer|
        rating = answer.rating
        key = case
        when rating <= points.first
          :sad
        when rating > points.first && rating < points.last
          :neutral
        else
          :happy
        end
        hash[key] = hash[key] + 1
      end
    end
    details[:total] = details.values.reduce(:+)
    details
  end

  def partition_points
    partition = (rating_scale/3).ceil
    partitions = [partition, partition * 2]
  end

  private

  def send_feedback_identifier
    CoreBox::Person.all.each do |person|
      feedback_token = SecureRandom.hex
      FeedbackTokenMailer.feedback_token_email(person, self, feedback_token)
    end
  end
end
