Rails.application.routes.draw do
  resources :friends
  root :to => redirect('/members')
  resources :members
end
