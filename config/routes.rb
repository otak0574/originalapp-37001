Rails.application.routes.draw do
  resources :agent_addresses, except: [:index]
  resources :addresses, except: [:index, :destroy, :show]
  resources :deliveries, only: [:index, :show]
  resources :cart_items
  resources :carts do
    member do
      post 'purchase' # memberメソッドを使って、特定のカートアイテムに対するpurchaseアクションを追加
    end
  end

  resources :orders, only:[:index, :create]

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
    get 'store_addresses/:id/edit', to: 'stores/registrations#edit_store_address'
    patch 'store_addresses/:id', to: 'stores/registrations#update_store_address'

    get 'store_informations', to: 'stores/registrations#new_store_information'
    post 'store_informations', to: 'stores/registrations#create_store_information'
    get 'store_informations/:id/edit', to: 'stores/registrations#edit_store_information'
    patch 'store_informations/:id', to: 'stores/registrations#update_store_information'
  end
  devise_for :customers, controllers: {
    registrations: "customers/registrations",
    sessions: "customers/sessions",
    passwords: "customers/passwords",
    confirmations: "customers/confirmations"
}

  devise_for :deli_agents, controllers: {
    registrations: "deli_agents/registrations",
    sessions: "deli_agents/sessions",
    passwords: "deli_agents/passwords",
    confirmations: "deli_agents/confirmations"
  }
  resources :publicstores, only: [:show, :edit, :update]
  resources :items do
    collection do
      get 'search'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
