class Admin::LessonsController < Admin::BaseController
  before_action :set_course_module, only: [:new, :create]
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def show; end

  # GET /admin/course_modules/1/lessons/new
  def new
    @lesson = @course_module.lessons.build
  end

  # POST /admin/course_modules/1/lessons
  def create
    @lesson = @course_module.lessons.build(lesson_params)

    if @lesson.save
      redirect_to admin_course_path(@course_module.course),
                  notice: t("admin.lessons.create.success")
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /admin/lessons/1/edit
  def edit; end

  # PATCH/PUT /admin/lessons/1
  def update
    if @lesson.update(lesson_params)
      redirect_to admin_course_path(@lesson.course_module.course),
                  notice: t("admin.lessons.update.success")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/lessons/1
  def destroy
    @course = @lesson.course_module.course

    if @lesson.destroy

      redirect_to admin_course_path(@course),
                  notice: t("admin.lessons.destroy.success")
    else

      error_message = @lesson.errors.full_messages.join(", ")

      alert_message = error_message.presence ||
                      t("admin.lessons.destroy.failure")

      redirect_to admin_course_path(@course),
                  alert: alert_message
    end
  end

  private

  def set_course_module
    @course_module = CourseModule.find_by(id: params[:course_module_id])

    return unless @course_module.nil?

    redirect_to admin_courses_path
  end

  def set_lesson
    @lesson = Lesson.find_by(id: params[:id])

    return unless @lesson.nil?

    redirect_to admin_courses_path
  end

  def lesson_params
    params.require(:lesson).permit(:title, :description, :video_url,
                                   :attachment_url, :order_index)
  end
end
