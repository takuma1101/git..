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
    resources :orders,only:[:index,:show,:update]
     resources :order_items, only:[:update]

  end



    namespace :public do
     get '/about' => 'homes#about'
     get 'orders/new'
     get 'orders/index'
     get 'orders/show'
     get 'orders/thank'

     end

   namespace :public do
    get '/customer' => 'customers#show'
    get '/customer/edit' => 'customers#edit'
    patch '/customer' => 'customers#update'
    get '/customer/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customer/withdrawal' => 'customers#withdrawal', as: 'withdrawal'

    resources :items,only:[:index, :show]
    resources :cart_items, only: [:index, :create, :destroy, :update]
    resources :orsers,only:[:new, :index, :show, :thank]
    resources :addresses,only:[:index,:edit, :create]
     delete "cart_items/destroy_all" => "cart_items#destroy_all"
  end

   devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
