Rails.application.routes.draw do
  resources :pours

  namespace :api do
    namespace :v1 do
      get :csrf, to: 'csrf#index'
      get :current_user, to: 'users#current'
      resources :ballots do
        put '/swap/:li1/:li2', to: 'ballots#swap'
      end
      resources :line_items, only: [:update, :create]
      post :pour, to: 'pours#create'
    end
  end
end
