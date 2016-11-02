Rails.application.routes.draw do

  get 'guides/show'

  ActiveAdmin.routes(self)

  namespace :admin do
    resources :users do
      resources :products
      resources :videos
      resources :photos
      resources :ratings
      resources :companies
      resources :reviews
    end
    resources :father_categories do
      resources :categories
    end
    resources :categories do
      resources :sub_categories
      resources :photos
      resources :videos
      resources :users
    end
    resources :sub_categories do
      resources :products
    end
    resources :companies do
      resources :products
      resources :users
    end
    resources :products do
      resources :videos
      resources :photos
      resources :prices
      resources :ratings
      resources :reviews
      resources :users
    end
    resources :videos do
      resources :users
    end
    resources :photos do
      resources :users
    end
    resources :distributors do
      resources :companies
    end
  end

  root to: 'search#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
    collection do
      get :review
      get :photo
      get :video

      get :reviews
      get :social
      get :favourites
    end
  end
  get 'ajax_destroy_recent_search', to: 'users#ajax_destroy_recent_search', as: :ajax_destroy_recent_search
  get 'ajax_destroy_favourite', to: 'users#ajax_destroy_favourite', as: :ajax_destroy_favourite
  get 'ajax_destroy_all_favourites', to: 'users#ajax_destroy_all_favourites', as: :ajax_destroy_all_favourites
  get 'ajax_destroy_recent_searches', to: 'users#ajax_destroy_recent_searches', as: :ajax_destroy_recent_searches
  get 'ajax_get_filter_options/:id' => 'products#set_filter_options', as: :set_filter_options

  post 'ajax_set_product_rating', to: 'products#ajax_set_product_rating', as: :ajax_set_product_rating

  resources :home, only: [:index]
  resources :search, only: [:index] do
    member do
      get 'remove'
    end
  end
  resources :sub_categories, only: [:show] do
    resources :guides, only: [:show]
  end
  resources :products, only: [:show] do
    resources :reviews, defaults: { formats: [:json, :html] }
    resources :user_favourite_products, only: [:add, :remove] do
      collection do
        get 'add'
        get 'remove'
      end
    end
  end

  resource :pictures, format: false, only: :create
  resources :photos, format: false, only: [:create, :show, :edit, :update, :destroy]
  resources :videos, format: false, only: [:create, :show, :edit, :update, :destroy]

  post '/modals/:action', controller: :modals, format: false, as: :modals
  get '/modals/fetch' => 'modals#fetch', format: :json
end
