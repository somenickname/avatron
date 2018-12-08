Rails.application.routes.draw do
  resource :session
  root 'dashboards#show'
  # namespace :api do ||
  #   get 'avatar/:hash', to: 'api#get_avatar'
  # end
  # scope '/api' do
  #   get '/avatar/:hash', to: 'api#get_avatar'
  # end
  get '/api/avatar/:hash', to: 'api#get_avatar'
end
