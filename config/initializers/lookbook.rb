# config/initializers/lookbook.rb
Lookbook.configure do |config|
  config.component_paths << Rails.root.join("app/components")
  config.preview_layout      = "lookbook/preview"
end
