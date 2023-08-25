# frozen_string_literal: true

Rails.application.routes.draw do
  get 'offices/:id', to: 'offices#show'
  get 'prefectures/:prefecture_id/cities/:city_id', to: 'cities#show', as: :city
  get 'assessment/:office_id', to: 'assessment#show'

  mount KomachiHeartbeat::Engine => '/ops'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
