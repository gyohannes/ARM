Rails.application.routes.draw do
  resources :match_results
  resources :events
  resources :program_quotas
  resources :academic_years
  resources :university_choices
  resources :program_choices
  resources :universities
  resources :programs
  resources :applicants do
    member do
      get 'details'
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  get 'home/index'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
