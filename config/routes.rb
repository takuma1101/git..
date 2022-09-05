Rails.application.routes.draw do



   root to: 'public/homes#top'
   get '/admin' => 'admin/homes#top'
  devise_for :admin,skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions'
}

namespace :admin do

    resources :genres
    resources :items
    resources :customers
    resources :orders,only:[:show,:update]
    resources :order_details,only:[:update]


  end





   namespace :public do
    get '/about' => 'homes#about'
    get '/customer/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customer/withdrawal' => 'customers#withdrawal', as: 'withdrawal'

    resources :items, only:[:index, :show]
    resources :customers, only:[:show, :edit, :update]
    resources :cart_items, only: [:index, :create, :destroy, :update]
    delete "cart_items" => "cart_items#destroy_all", as: 'destroy_all'
     post "/orders/confirm" => "orders#confirm"
    get "/orders/thanks" => "orders#thanks"
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :destroy, :update]

  end

   devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
