Rails.application.routes.draw do
  devise_for :users
  resources :groups do
  	resources :expenses
    resources :memberships
  end
  root "pages#home"
  get "about" => "pages#about"
  post '/groups/:group_id/memberships/inlinenew', to: 'memberships#create', as: 'inline_create_group_membership'
end
