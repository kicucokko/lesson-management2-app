Rails.application.routes.draw do
  root  'homes#index'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations' 
  }
  resources :users, only:[:show,:edit,:destroy]
  resources :lesson_rooms, only:[:new,:create,:show,:edit,:update,:destroy] do
    resources :reviews,only:[:new,:create,:show,:edit,:update,:destroy]
  end
  resources :calenders,only:[:index,:new,:create,:show,:destroy]
end
