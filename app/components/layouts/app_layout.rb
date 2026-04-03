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
      body(class: "bg-gray-50 text-gray-900 min-h-screen flex flex-col") do
        render_nav
        render_flash
        main(class: "mx-auto max-w-7xl px-4 py-8 flex-1 w-full") { yield }
        render_footer
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

  def render_footer
    footer(class: "border-t border-gray-200 mt-12 py-4 px-4") do
      div(class: "mx-auto max-w-7xl text-sm text-gray-400") do
        plain "© KanbanFlow #{Date.today.to_fs(:short)}"
      end
    end
  end

  def render_flash
    return unless flash[:notice] || flash[:alert]
    div(class: "mx-auto max-w-7xl px-4 pt-4 space-y-2") do
      Alert(message: flash[:notice], variant: :success) if flash[:notice]
      Alert(message: flash[:alert],  variant: :danger)  if flash[:alert]
    end
  end

end
