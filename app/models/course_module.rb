class CourseModule < ApplicationRecord
  belongs_to :course

  has_many :lessons, dependent: :destroy

  # --- Validations ---
  validates :title, presence: true

  default_scope{order(order_index: :asc)}
end
