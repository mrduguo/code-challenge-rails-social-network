Rails.application.routes.draw do
  root :to => redirect('/members')
  resources :members do
    resources :friends, only: [:index, :new, :create, :destroy]
  end
end