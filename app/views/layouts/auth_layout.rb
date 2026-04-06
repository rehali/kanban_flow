# app/views/layouts/auth_layout.rb
class Views::Layouts::AuthLayout < Components::Base
  include Phlex::Rails::Helpers::CSRFMetaTags
  include Phlex::Rails::Helpers::CSPMetaTag
  include Phlex::Rails::Helpers::StylesheetLinkTag
  include Phlex::Rails::Helpers::JavascriptImportmapTags
  prop :title, String, default: -> { "KanbanFlow" }

  def view_template
    doctype
    html(id: "html-root", lang: "en", data: { turbo_permanent: true }) do
      head do
        meta(charset: "UTF-8")
        meta(name: "viewport", content: "width=device-width,initial-scale=1")
        title { @title }
        csrf_meta_tags
        csp_meta_tag
        meta(name: "turbo-refresh-method", content: "morph")
        meta(name: "turbo-refresh-scroll", content: "preserve")
        stylesheet_link_tag "tailwind", "data-turbo-track": "reload"
        stylesheet_link_tag "application", "data-turbo-track": "reload"
        javascript_importmap_tags
      end
      body(class: "bg-surface-alt h-screen flex items-center justify-center") { yield }
    end
  end
end