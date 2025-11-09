class Category < ApplicationRecord
  # Self-referential association (macro)
  belongs_to :parent, class_name: "Category", optional: true
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id",
dependent: :nullify

  has_many :courses, dependent: :nullify

  # Validation
  validates :name, presence: true, uniqueness: true
end
