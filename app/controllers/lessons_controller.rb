# app/controllers/lessons_controller.rb
class LessonsController < ApplicationController
  before_action :set_lesson, only: %i(show)

  before_action :authenticate_user!

  # GET /lessons/1
  def show
    @course = @lesson.course
  end

  private

  def set_lesson
    @lesson = Lesson.find_by(id: params[:id])

    return unless @lesson.nil?

    redirect_to admin_courses_path
  end
end
