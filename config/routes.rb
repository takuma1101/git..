Rails.application.routes.draw do




  get 'orders/index'
  get 'orders/show'
  get 'customers/new'
  get 'customers/index'
  get 'customers/show'
  get 'customers/edit'
   get '/admin' => 'admin/homes#top'
  devise_for :admin,skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

namespace :admin do

    resources :genres
    resources :items
    resources :customers

  end




  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
