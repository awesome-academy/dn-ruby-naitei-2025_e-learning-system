class User < ApplicationRecord
  enum role: {
    admin: "admin",
    instructor: "instructor",
    student: "student"
  }
  has_one :profile, dependent: :destroy
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :enrollments, dependent: :destroy
  has_many :enrolled_courses, through: :enrollments, source: :course

  has_many :quiz_attempts, dependent: :destroy
  has_many :progress_trackings, dependent: :destroy

  has_many :created_courses, class_name: Course.name, foreign_key: :creator_id,
dependent: :nullify
  has_many :created_quizzes, class_name: Quiz.name, foreign_key: :creator_id,
dependent: :nullify
  has_many :created_questions, class_name: Question.name,
foreign_key: :creator_id, dependent: :nullify
end
