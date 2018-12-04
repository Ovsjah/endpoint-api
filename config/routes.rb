Rails.application.routes.draw do
  root to: "admin/providers#index"
  post '/create', to: 'providers#create'

  namespace :admin do
    resources :providers, only: %i(index show new create edit update destroy)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
