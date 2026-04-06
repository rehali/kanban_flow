Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource  :registration, only: [:new, :create]

  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  # config/routes.rb
  namespace :cards   do resource :positions, only: [:update] end
  namespace :columns do resource :positions, only: [:update] end

  resources :boards do
    resources :members, only: [:index, :create, :destroy],
              controller: "board_members"
    resources :columns, shallow: true,
              only: [:create, :update, :destroy] do
      resources :cards, shallow: true,
                only: [:create, :update, :destroy]
    end
  end

  mount ActionCable.server => "/cable"

  root "boards#index"
end
