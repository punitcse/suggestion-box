Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :topics, only: [:create] do
        post :submit_feedback, on: :member
      end

      resources :questions do
        resources :answers
      end

      resources :suggestions
    end
  end
end
