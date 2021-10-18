Rails.application.routes.draw do

  devise_for :customers, controllers: { registrations: 'customers/registrations', sessions: 'customers/sessions' }
  devise_for :admins, controllers: { sessions: 'admins/sessions' }

#管理者
  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :shops, only: [:index, :edit, :new, :create, :destroy, :update]
    resources :customers, only: [:index, :show]
    resources :genres
    resources :areas, only: [:index]
    resources :atmospheres, only: [:index]
    resources :contacts, only: [:index] do
      resources :faqs, only: [:index, :create, :new]
    end
  end

  resources :admin, only: [:index, :new, :create, :show] do
    collection do
      post :confirm
    end
  end

  devise_scope :admin do
    get '/admins/sign_in' => 'admins/sessions#new'
    post '/admins/sign_in' => 'admins/sessions#create'
    delete '/admins/sign_out' => 'admins/sessions#destroy'
  end

# 会員
  scope module: :public do
    get 'homes/top'
    post 'homes/top' => 'homes#top'
    root to: 'homes#top'
    get 'search' => 'search#search'
    resources :customers, only: [:show, :edit, :quit, :update, :destroy]
    resources :areas, only: [:index]
    resources :atmospheres, only: [:index]
    resources :faqs, only: [:index]

    resources :contacts, only: [:new, :create] do
      collection do
        post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
        post 'contacts/back', to: 'contacts#back', as: 'back'
        get 'done', to: 'contacts#done', as: 'done'
      end
    end

    resources :shops do
      resources :comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
      resources :candidates, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
