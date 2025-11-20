class QuizAnswersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_quiz_attempt

  def create
    @quiz = @quiz_attempt.quiz
    question_id = params[:quiz_answer][:question_id]
    question_option_id = params[:quiz_answer][:question_option_id]
    @answer = @quiz_attempt.quiz_answers.new(
      question_id:,
      question_option_id:
      # selected_option_ids: selected_option_ids
    )

    flash[:alert] = t("quiz_answers.create.fail") unless @answer.save
    redirect_to quiz_attempt_path(@quiz_attempt)
  end

  private

  def set_quiz_attempt
    @quiz_attempt = QuizAttempt.find(params[:quiz_attempt_id])
    return if @quiz_attempt.user == current_user

    redirect_to root_path,
                alert: t("admin.authorization.denied")
  end
end
