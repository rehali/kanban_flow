Rails.application.routes.draw do
  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  # config/routes.rb
  namespace :cards   do resource :positions, only: [:update] end
  namespace :columns do resource :positions, only: [:update] end

  resources :boards do
    resources :columns, shallow: true do
      resources :cards, shallow: true
    end
  end

  mount ActionCable.server => "/cable"

  root "boards#index"
end
