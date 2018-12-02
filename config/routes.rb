Rails.application.routes.draw do
  resource :session
  root 'dashboards#show'
  post "/", to: "dashboards#show"
end
