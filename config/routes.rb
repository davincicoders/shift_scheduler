Rails.application.routes.draw do
  resources :employees

  root 'welcome#index'

  resource :organizations,
      only: [:new, :create],
      path_names: { new: 'signup' }

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
end
