# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'
  resources :offices, only: [:show]
  get 'prefectures/:prefecture_id/cities/:city_id', to: 'cities#show', as: :city
  get 'assessment', to: 'assessment#show'
  mount KomachiHeartbeat::Engine => '/ops'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
