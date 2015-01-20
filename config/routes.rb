WildDustPayroll::Application.routes.draw do

  devise_for :users
  root "employees#index"
  get "/about" => "about#index"

  resources :clothing_types
  resources :employees do
  	resources :sewed_clothings
  end
end
