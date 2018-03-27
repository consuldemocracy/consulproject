Rails.application.routes.draw do
  resources :installations, only: [:index, :show]
  root 'installations#index'
  get '/dashboard' => 'installations#index'
end
