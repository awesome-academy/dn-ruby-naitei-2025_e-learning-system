class ProgressTracking < ApplicationRecord
  enum progress_type: {lesson: "lesson", quiz: "quiz"}
  enum status: {not_started: "not_started", in_progress: "in_progress",
                completed: "completed"}

  belongs_to :user
  belongs_to :course
  belongs_to :lesson, optional: true
  belongs_to :quiz, optional: true
end
