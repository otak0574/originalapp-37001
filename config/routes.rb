Rails.application.routes.draw do
  devise_for :stores, controllers: {
    registrations: "stores/registrations",
    sessions: "stores/sessions",
    passwords: "stores/passwords",
    confirmations: "stores/confirmations"
  }
  devise_for :customers, controllers: {
    registrations: "customers/registrations",
    sessions: "customers/sessions",
    passwords: "customers/passwords",
    confirmations: "customers/confirmations"
}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
