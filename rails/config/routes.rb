# frozen_string_literal: true

Rails.application.routes.draw do
  get 'offices/:id', to: 'offices#show'
  
  mount KomachiHeartbeat::Engine => '/ops'
end
