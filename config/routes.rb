Rails.application.routes.draw do
  devise_for :users
  root "top#index"

  resources :list, only: %i(new create edit update destroy) do
    put :sort
    resources :card, except: %i(index)
  end
end
