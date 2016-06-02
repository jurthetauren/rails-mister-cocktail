Rails.application.routes.draw do
resources :cocktails do
    resources :doses, only: [:new, :create, :index, :show]
  end
  root to: 'cocktails#index'
end

