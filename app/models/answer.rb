class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :person, class_name: 'CoreBox::Person'

  validate_presence_of :question, :person
end
