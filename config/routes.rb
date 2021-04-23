Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope :admins do
    resources :company_branches
  end
  root to: 'company_branches#index'

  resources :logs, only: :create
  scope 'logs' do
    get 'check_in', to: 'logs#new'
    get 'check_out', to: 'logs#new'
  end
end
