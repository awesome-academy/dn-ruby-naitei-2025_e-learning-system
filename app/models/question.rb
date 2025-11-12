class Question < ApplicationRecord
  enum question_type: {single: "single", multiple: "multiple"}
  enum difficulty: {easy: "easy", medium: "medium", hard: "hard"}

  belongs_to :course, optional: true
  belongs_to :lesson, optional: true
  belongs_to :creator, class_name: "User",
optional: true

  has_many :question_options, dependent: :destroy
  has_many :quiz_questions, dependent: :destroy
  has_many :quizzes, through: :quiz_questions

  accepts_nested_attributes_for :question_options, allow_destroy: true
end
