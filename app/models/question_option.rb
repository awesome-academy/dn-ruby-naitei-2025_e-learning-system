class QuestionOption < ApplicationRecord
  belongs_to :question
  default_scope{order(option_order: :asc)}
end
