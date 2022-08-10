Rails.application.routes.draw do

 root 'public/homes#top'

   get '/admin' => 'admin/homes#top'
  devise_for :admin,skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

namespace :admin do

    resources :genres
    resources :items
    resources :customers
    resources :orders,only:[:index,:show,:update]
     resources :order_items, only:[:update]

  end

namespace :public do
     get '/about' => 'homes#about'

  end


  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
