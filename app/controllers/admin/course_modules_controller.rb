class Admin::CourseModulesController < Admin::BaseController
  before_action :set_course, only: [:new, :create]
  before_action :set_course_module, only: [:show, :edit, :update, :destroy]

  # GET /admin/courses/1/course_modules/new
  def new
    @course_module = @course.course_modules.build
  end

  # POST /admin/courses/1/course_modules
  def create
    @course_module = @course.course_modules.build(course_module_params)

    if @course_module.save
      redirect_to admin_course_path(@course),
                  notice: t("admin.course_modules.create.success")
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /admin/course_modules/1/edit
  def edit; end

  # GET /admin/course_modules/1
  def show; end

  # PATCH/PUT /admin/course_modules/1
  def update
    if @course_module.update(course_module_params)
      redirect_to admin_course_path(@course_module.course),
                  notice: t("admin.course_modules.update.success")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course = @course_module.course

    if @course_module.destroy
      redirect_to admin_course_path(@course),
                  notice: t("admin.course_modules.destroy.success")
    else
      error_message = @course_module.errors.full_messages.join(", ")

      alert_message = error_message.presence ||
                      t("admin.course_modules.destroy.failure")

      redirect_to admin_course_path(@course),
                  alert: alert_message
    end
  end

  private

  def set_course
    @course = Course.find_by(id: params[:course_id])

    return unless @course.nil?

    redirect_to admin_courses_path
  end

  def set_course_module
    @course_module = CourseModule.find_by(id: params[:id])

    return unless @course_module.nil?

    redirect_to admin_courses_path
  end

  def course_module_params
    params.require(:course_module).permit(:title, :description, :order_index)
  end
end
