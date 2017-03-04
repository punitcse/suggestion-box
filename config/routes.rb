Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :topics, only: [:index] do
        post :submit_feedback, on: :member
      end

      resources :questions

      resources :suggestions
    end
  end

  namespace :admin do
    resources :topics do
      resources :questions
    end
  end
end
