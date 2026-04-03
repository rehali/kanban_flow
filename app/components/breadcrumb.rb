# app/components/breadcrumb.rb
class Components::Breadcrumb < Components::Base

  def after_initialize
    @items = []
  end

  def view_template(&)
    vanish(&)
    nav(aria: { label: "Breadcrumb" }) do
      ol(class: "flex items-center gap-2 text-sm text-text-muted") do
        @items.each_with_index do |item, index|
          li(class: "flex items-center gap-2") do
            if index < @items.length - 1
              a(href: item[:url], class: "hover:text-text") { item[:label] }
              span(class: "text-border") { "/" }
            else
              span(class: "text-text font-medium") { item[:label] }
            end
          end
        end
      end
    end
  end

  def item(label, url: nil)
    @items << { label:, url: }
    nil
  end
end
