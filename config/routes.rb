# frozen_string_literal: true

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'contact', to: 'contact#index'
  resource :contact_message,
           only: :create,
           as: 'contact',
           path: 'contact',
           controller: 'contact'

  get 'about', to: 'home#about'

  root 'home#index'
end
