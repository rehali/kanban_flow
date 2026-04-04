class TabsPreview < Lookbook::Preview
  layout "lookbook/preview"

  class Default < Components::Base
    def view_template
      Tabs() do |t|
        t.tab "Overview" do
          p { "Board overview content." }
        end
        t.tab "Members" do
          p { "Member list content." }
        end
        t.tab "Settings" do
          p { "Board settings content." }
        end
      end
    end
  end

  def default = render Default.new
end