Rails.application.routes.draw do
  get 'home/show'

  get 'auth/:provider/callback', to: 'sessions#create'
     get 'auth/failure', to: redirect('/')
     get 'signout', to: 'sessions#destroy', as: 'signout'

     resources :sessions, only: [:create, :destroy]
     resource :home, only: [:show]

     root "home#show"

     resources :searches, only: [:index]

     resources :lists do
      resources :suggestions, only: [:index, :create, :new, :destroy]
    end

    resource :suggestion, only: [:show]


    namespace :api do
      namespace :v1 do
        resources :lists
    end
  end

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
