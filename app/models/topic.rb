class Topic < ApplicationRecord
  has_many :questions
  belongs_to :person, class_name: 'CoreBox::Person'

  accepts_nested_attributes_for :questions
end
