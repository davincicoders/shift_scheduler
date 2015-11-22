Rails.application.routes.draw do
  resources :employees

  root 'welcome#index'

  resource :organization,
      only: [:new, :create],
      path_names: { new: 'signup' }
end
