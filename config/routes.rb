Rails.application.routes.draw do
  root to: 'publicstores#index'
  devise_for :stores, controllers: {
    registrations: "stores/registrations",
    sessions: "stores/sessions",
    passwords: "stores/passwords",
    confirmations: "stores/confirmations"
  }
  devise_scope :store do
    get 'store_addresses', to: 'stores/registrations#new_store_address'
    post 'store_addresses', to: 'stores/registrations#create_store_address'
  end
  devise_for :customers, controllers: {
    registrations: "customers/registrations",
    sessions: "customers/sessions",
    passwords: "customers/passwords",
    confirmations: "customers/confirmations"
}

resources :publicstores, only: [:show, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
