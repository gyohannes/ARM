Rails.application.routes.draw do

  resources :participants do
    collection do
      get 'badges'
      get 'load_directorates'
      post 'import_participants'
    end
  end

  resources :directorates
  resources :groups
  resources :participant_types
  resources :organization_types
  resources :events
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  scope "/admin" do
    resources :users do
      member do
        get 'confirm'
      end
    end
  end

  get 'home/index'
  root to: 'participants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
