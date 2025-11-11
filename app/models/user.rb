class User < ApplicationRecord
  enum role: {
    admin: "admin",
    instructor: "instructor",
    student: "student"
  }

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
