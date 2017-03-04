Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post :topics, to: "topics#create"
      get :topics, to: "topics#index"

      resources :questions do
        resources :answers
      end

      resources :suggestions
    end
  end
end
