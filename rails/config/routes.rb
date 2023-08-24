# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'offices/:id', to: 'offices#show' <- controller作成後はこっちに
  get 'offices', to: 'offices#show'

  mount KomachiHeartbeat::Engine => '/ops'
end
