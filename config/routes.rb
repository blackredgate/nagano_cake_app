Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    get 'top' => 'homes#top'
    resources :items
    resources :customers, only:[:index, :show, :edit, :update]
  end

  scope module: :public do
    resources :items, only:[:index, :show]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only:[:index, :update, :destroy, :create]
  end

  get '/customers' => 'public/customers#show'
  get '/customers/information/edit' => 'public/customers#edit'
  patch '/customers/information' => 'public/customers#update'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw'

  root to: 'homes#top'
  get '/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
