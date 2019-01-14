Rails.application.routes.draw do
  get '/stations', to: 'searches#stations'
  get '/search', to: 'searches#networks'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
