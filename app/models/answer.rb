class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :core_box_person, class_name: 'CoreBox::Person'

  validates_presence_of :question, :core_box_person
end
