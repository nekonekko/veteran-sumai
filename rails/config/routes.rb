# frozen_string_literal: true

Rails.application.routes.draw do
  get 'offices', to: 'offices#show'
  
  mount KomachiHeartbeat::Engine => '/ops'
end
