Rails.application.routes.draw do
  resource :session
  root 'dashboards#show'
end
