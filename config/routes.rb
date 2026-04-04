Rails.application.routes.draw do
  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  resources :boards do
    resources :columns, shallow: true do
      resources :cards, shallow: true
    end
  end

  root "boards#index"
end
