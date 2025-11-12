class QuizAnswer < ApplicationRecord
  belongs_to :quiz_attempt
  belongs_to :question
  belongs_to :question_option, optional: true

  serialize :selected_option_ids, Array
end
