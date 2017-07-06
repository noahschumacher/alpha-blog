Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  get 'about', to: 'pages#about'


  # This gives us: index, create, new, edit, show, update, destroy
  resources :articles

end
