Rails.application.routes.draw do
  devise_for :users
  resources :groups do
  	resources :expenses
  end
  root "pages#home"
  get "about" => "pages#about"
end
