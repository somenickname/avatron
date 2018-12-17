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

	post 'profile', to: 'users#edit'
  post 'profile/add_number', to: 'users#add_number'
  get 'profile/add_number', to: 'users#add_number'
  delete 'profile', to: 'users#destroy'
  get 'profile', to: 'users#show'

end
