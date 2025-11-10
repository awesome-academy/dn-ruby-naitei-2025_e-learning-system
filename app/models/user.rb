class User < ApplicationRecord
  enum role: {
    admin: "admin",
    instructor: "instructor",
    student: "student"
  }

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  def admin?
    role == "admin"
  end

  def instructor?
    role == "instructor"
  end

  def student?
    role == "student"
  end
end
