# app/models/lesson.rb
class Lesson < ApplicationRecord
  belongs_to :course_module

  has_one :course, through: :course_module

  validates :title, presence: true

  default_scope{order(order_index: :asc)}
end
