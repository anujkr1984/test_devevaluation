Rails.application.routes.draw do
  post '/phones', to: 'phones#create'
  post '/phones/:number', to: 'phones#create'
  get '/phones', to: 'phones#index'

end
