class QuizQuestion < ApplicationRecord
  belongs_to :quiz
  belongs_to :question
  default_scope{order(order_index: :asc)}
end
