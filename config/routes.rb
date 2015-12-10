Rails.application.routes.draw do
  resources :shifts
  resources :employees, :managers
  resources :schedules, only: [:show]
  resources :organizations
  resources :departments

  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'

  get 'signup' => 'employees#new_signup', as: 'new_signup'
  post '/employees' => 'employees#signup', as: 'signup'

  get 'login' => 'sessions#login', as: 'login'
  post 'login' => 'sessions#create'
  get "/auth/:provider/callback" => 'sessions#oauth'
  delete 'logout' => 'sessions#destroy'

  get '/calendar' => 'calendars#index'

  get 'organizations/join/:id' => 'organizations#join', as: 'join_organization'
  get '/switch/:id' => 'departments#switch', as: 'switch_department'
end
