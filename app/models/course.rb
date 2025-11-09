class Course < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :creator, class_name: "User", foreign_key: "created_by",
optional: true

  # Validation
  validates :title, presence: true
end
