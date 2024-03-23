Rails.application.routes.draw do
  root to: 'publicstores#index'
  get '/stores', to: 'publicstores#index'
  devise_for :stores, controllers: {
    registrations: "stores/registrations",
    sessions: "stores/sessions",
    passwords: "stores/passwords",
    confirmations: "stores/confirmations"
  }
  devise_scope :store do
    get 'store_addresses', to: 'stores/registrations#new_store_address'
    post 'store_addresses', to: 'stores/registrations#create_store_address'

    get 'store_informations', to: 'stores/registrations#new_store_information'
    post 'store_informations', to: 'stores/registrations#create_store_information'

    get 'store_categories', to: 'users/registrations#new_store_category'
    post 'store_categories', to: 'users/registrations#create_store_category'
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
