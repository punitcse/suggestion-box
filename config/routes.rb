Rails.application.routes.draw do
  mount CoreBox::Engine => "/core_box"

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
  get :home, to: 'pages#home'
  get :topics, to: 'pages#topics'
end
