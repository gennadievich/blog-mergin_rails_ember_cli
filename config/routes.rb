Rails.application.routes.draw do
  resources :pours

  namespace :api do
    namespace :v1 do
      get :csrf, to: 'csrf#index'
      resources :ballots do
        put '/swap/:li1/:li2', to: 'ballots#swap'
      end
      resources :line_items, only: [:update, :create]
    end
  end
end
