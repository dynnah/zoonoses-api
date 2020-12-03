Rails.application.routes.draw do

  resources :animals
  resources :cuidadors, param: :_id
  post '/cuidadors/login', to: 'authentication#login'
  
  resources :funcionarios, param: :_id
  post '/funcionarios/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
