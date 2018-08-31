Rails.application.routes.draw do
  resources :installations, only: [:index, :show, :new, :create]
  root 'installations#index'
  get '/dashboard' => 'installations#index'
end
