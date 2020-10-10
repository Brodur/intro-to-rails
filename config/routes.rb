Rails.application.routes.draw do
  resources :planets, only: %i[index show]
  resources :species, only: %i[index show]
  resources :films, only: %i[index show]

  root to: "index#index"
end
