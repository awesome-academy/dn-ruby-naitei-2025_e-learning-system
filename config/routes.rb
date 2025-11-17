# config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  # ==================================================
  # 1. USER Routes (Phần cho Học viên)
  # ==================================================
  root "courses#index"

  resources :courses, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :lessons, only: [:show]

  # --- Luồng Làm Bài Quiz (Phần 4 & 5) ---

  # 1. Để User BẮT ĐẦU làm bài (Tạo QuizAttempt)
  #    POST /quizzes/:quiz_id/quiz_attempts
  resources :quizzes, only: [] do # 'only: []' vì User không cần trang /quizzes
    resources :quiz_attempts, only: [:create], shallow: false
  end

  # 2. Để User LÀM BÀI (Trang phòng thi)
  #    GET /quiz_attempts/:id
  # 3. Để User NỘP CÂU TRẢ LỜI
  #    POST /quiz_attempts/:quiz_attempt_id/quiz_answers
  resources :quiz_attempts, only: [:show] do
    resources :quiz_answers, only: [:create], shallow: false
  end


  # ==================================================
  # 2. ADMIN Routes (Phần Quản trị)
  # ==================================================
  namespace :admin do
    # root to: "dashboard#index" # (Bạn có thể bật sau)

    # Quản lý Danh mục
    resources :categories

    # Quản lý Ngân hàng câu hỏi
    resources :questions

    # Quản lý Khóa học, Chương, Bài học
    resources :courses do
      resources :course_modules, shallow: true do
        resources :lessons, shallow: true
      end
    end

    # Quản lý Bài kiểm tra (CRUD)
    # VÀ Thêm câu hỏi vào bài kiểm tra (Phần 3)
    # (POST /admin/quizzes/:quiz_id/quiz_questions)
    resources :quizzes do
      resources :quiz_questions, only: [:create], shallow: false
    end

    # Xóa câu hỏi khỏi bài kiểm tra (Phần 3)
    # (DELETE /admin/quiz_questions/:id)
    resources :quiz_questions, only: [:destroy]
  end

end
