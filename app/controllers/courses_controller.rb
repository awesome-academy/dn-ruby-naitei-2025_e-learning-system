class CoursesController < ApplicationController
  before_action :set_course, only: %i(show edit update destroy)
  # before_action :authenticate_user!
  before_action :authorize_admin!, except: %i(index show)

  def index
    @courses = Course.includes(:category).all
  end

  def show; end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.created_by = current_user.id
    if @course.save
      redirect_to @course, notice: "Course created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: "Course updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, alert: "Course deleted!"
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :category_id,
                                   :thumbnail_url)
  end

  def authorize_admin!
    return if current_user.admin?

    redirect_to courses_path,
                alert: "Access Denni!"
  end
end
