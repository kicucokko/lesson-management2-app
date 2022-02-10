Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'homes#index'
  resources :users, only:[:show,:edit,:destroy]
  resources :lesson_rooms, only:[:new,:create,:show,:edit,:update,:destroy] do
    resources :reviews,only:[:new,:create,:show,:edit,:update,:destroy]
  end
  resources :calenders, only: [:index,:new,:create,:show]
end
