Rails.application.routes.draw do
  mount CoreBox::Engine => "/core_box"

  namespace :api do
    namespace :v1 do
      resources :topics do
        member do
          get :graph
        end
      end

      resources :questions do
        resources :answers
      end

      resources :topics, only: [:index] do
        put :submit_feedback, on: :member
        get :feedback_form, on: :member
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
  get :home, to: 'pages#home'
  get :topics, to: 'pages#topics'

  resources :topics, except: [:index]
  resources :suggestions

  root "pages#home"
end
