class QuizQuestion < ApplicationRecord
  validates :question_id,
            uniqueness: {
              scope: :quiz_id,
              message: I18n.t("models.quiz_question.errors.already_in_quiz")
            }

  belongs_to :quiz
  belongs_to :question

  default_scope{order(order_index: :asc)}
end
