# test/components/previews/breadcrumb_preview.rb
class BreadcrumbPreview < Lookbook::Preview
  def two_levels
    render Components::Breadcrumb.new { |b|
      b.item "Boards", url: "#"
      b.item "My Project Board"
    }
  end

  def three_levels
    render Components::Breadcrumb.new { |b|
      b.item "Boards",             url: "#"
      b.item "My Project Board",   url: "#"
      b.item "Design column"
    }
  end
end
