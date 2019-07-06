# frozen_string_literal: true

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'contact', to: 'contact#index'
  resource :contact_message,
    only: :create,
    as: 'contact',
    path: 'contact',
    controller: 'contact'

  root 'home#index'
end
