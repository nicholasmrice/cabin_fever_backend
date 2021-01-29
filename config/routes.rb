Rails.application.routes.draw do
  get '/cabins', to: 'cabins#index'
  get '/cabins/:id', to: 'cabins#show'
  post '/cabins', to: 'cabins#create'
  delete '/cabins/:id', to: 'cabins#delete'
  put '/cabins/:id', to: 'cabins#update'
end
