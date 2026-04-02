# config/initializers/lookbook.rb
# config/initializers/lookbook.rb
if defined?(Lookbook)
  Lookbook.configure do |config|
    config.component_paths  << Rails.root.join("app/components")
    config.preview_layout   = "lookbook/preview"
  end
end