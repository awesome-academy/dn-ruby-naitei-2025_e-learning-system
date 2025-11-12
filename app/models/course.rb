class Course < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :creator, class_name: User.name, foreign_key: "created_by",
optional: true
  has_many :course_modules, dependent: :destroy
  has_many :lessons, through: :course_modules
  # Validation
  validates :title, presence: true
  scope :recent, ->{order(created_at: :desc)}
end
