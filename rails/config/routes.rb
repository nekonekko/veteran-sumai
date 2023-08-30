# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'
  resources :offices, only: [:show]
  resources :prefectures, only: [] do
    resources :cities, only: [:show]
  end
  resources :reviews, only: [:show]
  resources :assessments, only: %i[new create]
  mount KomachiHeartbeat::Engine => '/ops'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
