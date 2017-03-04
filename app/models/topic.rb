class Topic < ApplicationRecord
  has_many :questions
  belongs_to :person, class_name: 'CoreBox::Person'

  def graph_details
    points = partition_points
    default_hash = {sad: 0, neutral: 0, happy: 0}
    questions.question_type_ratings.includes(:answers).each_with_index({}) do |question, hash|
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
  end

  def partition_points
    partition = (rating_scale / 3).ceil
    partitions = [partition, partition * 2]
  end
end
