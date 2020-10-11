Rails.application.routes.draw do
  get "search", to: "search#search"

  resources :planets, only: %i[index show]
  resources :species, only: %i[index show]
  resources :films, only: %i[index show]

  root to: "index#index"
end
