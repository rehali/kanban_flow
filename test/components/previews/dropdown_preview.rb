class DropdownPreview < Lookbook::Preview
  layout "lookbook/preview"

  class AlignRight < Components::Base
    def view_template
      div(class: "flex justify-end") do
        Dropdown(label: "Actions", align: :right) do |d|
          d.item "Edit",    url: "#"
          d.item "Archive", url: "#"
          d.item "Delete",  url: "#"
        end
      end
    end
  end

  def default
    render Components::Dropdown.new(label: "Actions") { |d|
      d.item "Edit",    url: "#"
      d.item "Archive", url: "#"
      d.item "Delete",  url: "#"
    }
  end

  def align_right
    render AlignRight.new
  end
end