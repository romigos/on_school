# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    get 'disciplines/index'
    get 'disciplines/edit'
    get 'disciplines/destroy'
    get 'disciplines/create'
  end
  namespace :admin do
    root to: 'main#index'
    get 'main/index'
    resources :teachers, except: :show
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
