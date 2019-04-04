Rails.application.routes.draw do
  root :to => redirect('/members')
  resources :members
end
