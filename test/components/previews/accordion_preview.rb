class AccordionPreview < Lookbook::Preview
  layout "lookbook/preview"

  class SingleExpand < Components::Base
    def view_template
      Accordion() do |a|
        a.panel(title: "What is KanbanFlow?", open: true) do
          p { "A multi-user Kanban board built with Phlex and Rails 8." }
        end
        a.panel(title: "How do I create a board?") do
          p { "Click '+ New Board' from the boards index." }
        end
        a.panel(title: "Can I invite team members?") do
          p { "Yes — board membership is covered in Module 11." }
        end
      end
    end
  end

  class MultipleExpand < Components::Base
    def view_template
      Accordion(multiple: true) do |a|
        a.panel(title: "First panel", open: true) do
          p { "Multiple panels can be open at the same time." }
        end
        a.panel(title: "Second panel", open: true) do
          p { "Both of these start open." }
        end
        a.panel(title: "Third panel") do
          p { "This one starts closed." }
        end
      end
    end
  end

  def single_expand = render SingleExpand.new
  def multiple_expand = render MultipleExpand.new
end