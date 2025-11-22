class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @courses = Course.includes(:category).recent
  end

  def show
    @course = Course.includes(course_modules: :lessons).find_by(id: params[:id])
    return unless @course.nil?

    redirect_to courses_path
  end
end
