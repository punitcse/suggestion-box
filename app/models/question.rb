class Question < ApplicationRecord
  belongs_to :topic

  as_enum :question_type, %(rating subjective)
end
