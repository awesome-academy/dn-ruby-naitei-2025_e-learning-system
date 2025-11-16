Rails.application.routes.draw do

  root "courses#index"
  resources :courses, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :lessons, only: [:show]

  namespace :admin do
    # root to: "dashboard#index"
    resources :categories
    resources :questions
    resources :quizzes
    resources :quiz_questions, only: [:destroy]
    resources :courses do
      resources :course_modules, shallow: true do
        resources :lessons, shallow: true
      end
    end
    resources :quizzes do
      resources :quiz_questions, only: [:create], shallow: false
    end
  end
end
