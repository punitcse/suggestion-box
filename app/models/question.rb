class Question < ApplicationRecord
  belongs_to :topic
  has_many :answers
  as_enum :question_type, %i(rating subjective), prefix: true

  validates_presence_of :content

  accepts_nested_attributes_for :answers
end
