Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post :topics, to: "topics#create"

      resources :questions do
        resources :answers
      end
    end
  end
end
