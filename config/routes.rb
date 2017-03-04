Rails.application.routes.draw do
  mount CoreBox::Engine => "/core_box"

  namespace :api do
    namespace :v1 do
      resources :topics, only: [:create, :index] do
        post :submit_feedback, on: :member
      end

      resources :questions

      resources :suggestions
    end
  end
  get :home, to: 'pages#home'
  get :topics, to: 'pages#topics'
end
