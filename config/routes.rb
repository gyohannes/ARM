Rails.application.routes.draw do
  resources :timers, path: 'countdown' do
    collection do
      get 'load_deadline'
    end
  end
  resources :application_instructions
  resources :applicant_declarations
  resources :declarations
  resources :applicant_services do
    collection do
      get 'load_services'
    end
  end
  resources :applicant_exam_hubs
  resources :exam_hubs
  resources :regions
  resources :match_results
  resources :events
  resources :program_quotas
  resources :academic_years
  resources :university_choices
  resources :program_choices
  resources :universities
  resources :programs
  resources :applicants do
    collection do
      get 'instructions'
    end
    member do
      get 'details'
      get 'submit'
    end
  end
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
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
