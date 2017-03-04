Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :topics do
        member do
          get :graph
        end
      end

      post :topics, to: "topics#create"

      resources :questions do
        resources :answers
      end

      resources :suggestions
    end
  end
end
