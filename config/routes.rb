Rails.application.routes.draw do
  root :to => redirect('/members')
  resources :members do
    get 'search' => 'members#search_all', on: :collection
    get 'search' => 'members#search_by_member', on: :member
    resources :friends, only: [:index, :new, :create, :destroy]
  end
end