Rails.application.routes.draw do
  root 'rooms#index'
  resources :rooms

  post '/rooms/:id/cell_click', to: 'rooms#cell_click'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
