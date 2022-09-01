Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit', to: 'devise/registrations#edit', as: :edit_user_registration
    put 'users/:id', to: 'devise/registrations#update', as: :user_registration
  end
  get 'dashboard', to: 'dashboard#index', as: :user_root
  get 'dashboard', to: 'dashboard#index', as: :dashboard

	root to: 'pages#home'
	get 'about', to: 'pages#about'
	get 'contact', to: 'pages#contact'
  get 'informations', to: 'pages#informations'
  resources :posts, only:[:show, :new, :create, :edit, :update, :destroy]
  resources :informations, only:[:edit, :update]
end
