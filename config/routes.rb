Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :topics, only: [:create, :index] do
        post :submit_feedback, on: :member
      end

      resources :questions

      resources :suggestions
    end
  end
end
