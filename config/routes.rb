# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    namespace :api do
      get 'tinymce_images/create'
    end
  end
  scope :admin do
    devise_for :admins, controllers: {sessions: 'admin/admins/sessions'}
  end

  namespace :admin do
    root to: 'main#index'
    resources :teachers, except: :show
    resources :disciplines, except: :show

    resources :courses, except: :show do
      resources :lessons, except: :show
    end
    namespace :api do
      resources :lessons, only: [] do
        post :sort, on: :collection
      end
      resources :lessons, only: [] do
        resources :tinymce_images, only: :create
      end
    end
  end
end
