class Profile < ApplicationRecord
  belongs_to :user
  enum gender: {
    male: "male",
    female: "female",
    other: "other"
  }

  validates :user_id, uniqueness: true
end
