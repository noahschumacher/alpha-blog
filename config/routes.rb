Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  get 'about', to: 'pages#about'

  # When user goes to /signup sends them to user controller, new action
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # This gives us: index, create, new, edit, show, update, destroy
  resources :articles

end
