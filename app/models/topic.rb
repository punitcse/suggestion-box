class Topic < ApplicationRecord
  has_many :questions
  has_many :feedback_identifiers
  belongs_to :person, class_name: 'CoreBox::Person'

  accepts_nested_attributes_for :questions
end
