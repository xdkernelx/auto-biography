Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :mechanics

  resources :specials
  
  match '/cars/:car_id/history' => "users#index", :as => 'car_history', :via => "get"

  resources :cars do
    resources :maintenances
    resources :issues do
      resources :repairs
    end
  end
end
