Rails.application.routes.draw do
  resource :session
  root 'dashboards#show'
  namespace :api, default: {format: :json} do ||
    get '/avatar/:hash', to: 'api#show'
  end
end
