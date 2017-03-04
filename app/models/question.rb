class Question < ApplicationRecord
  belongs_to :topic
  has_many :answers
  as_enum :question_type, %i(rating subjective), prefix: true

  accepts_nested_attributes_for :answers

end
