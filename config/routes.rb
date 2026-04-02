Rails.application.routes.draw do
  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  root "home#index"
  get "about", to: "home#about"

  get "up" => "rails/health#show", as: :rails_health_check
end
