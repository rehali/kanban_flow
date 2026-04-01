# app/components/layouts/app_layout.rb
#
class Components::Layouts::AppLayout < Components::Base
  include Phlex::Rails::Helpers::CSRFMetaTags
  include Phlex::Rails::Helpers::CSPMetaTag
  include Phlex::Rails::Helpers::StylesheetLinkTag
  include Phlex::Rails::Helpers::JavascriptImportmapTags

  def initialize(title: "KanbanFlow")
    @title = title
  end

  def view_template
    doctype
    html(lang: "en") do
      head do
        meta(charset: "UTF-8")
        meta(name: "viewport", content: "width=device-width,initial-scale=1")
        title { @title }
        csrf_meta_tags
        csp_meta_tag
        stylesheet_link_tag "tailwind", "data-turbo-track": "reload"
        stylesheet_link_tag "application", "data-turbo-track": "reload"
        javascript_importmap_tags
      end
      body(class: "bg-gray-50 text-gray-900") do
        render_nav
        main(class: "mx-auto max-w-7xl px-4 py-8") { yield }
      end
    end
  end

  private

  def render_nav
    nav(class: "bg-white border-b border-gray-200 px-4 py-3") do
      div(class: "mx-auto max-w-7xl flex items-center justify-between") do
        a(href: root_path, class: "font-bold text-lg text-gray-900") { "KanbanFlow" }
      end
    end
  end
end
