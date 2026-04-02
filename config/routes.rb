Rails.application.routes.draw do
  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  resources :boards, only: [:index, :show, :new, :create]
  root "boards#index"
end
