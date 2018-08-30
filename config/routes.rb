Rails.application.routes.draw do
  resources :installations, only: [:index, :show, :new]
  root 'installations#index'
  get '/dashboard' => 'installations#index'
end
