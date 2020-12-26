Rails.application.routes.draw do
  resources :board_users
  resources :cards
  resources :swim_lanes
  resources :boards
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
