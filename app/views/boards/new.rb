# app/views/boards/new.rb
class Views::Boards::New < Views::Base
  def page_title = "New Board"
  def initialize(board:)
    @board = board
  end
  def view_template
    Breadcrumb() do |b|
      b.item "Boards", url: boards_path
      b.item "New Board"
    end
    div(class: "max-w-lg mt-6") do
      h1(class: "text-2xl font-bold text-gray-900 mb-6") { "New Board" }
      form_with(model: @board, class: "space-y-4") do |f|
        div do
          f.label     :name, "Board name",
                      class: "block text-sm font-medium text-gray-700 mb-1"
          f.text_field :name,
                       class:       "w-full rounded-md border border-gray-300 " \
                         "px-3 py-2 text-sm bg-white text-gray-900",
                       placeholder: "e.g. Marketing Q3"
        end
        button(
          type:  "submit",
          class: "inline-flex items-center justify-center rounded-md " \
            "font-medium bg-blue-600 text-white hover:bg-blue-700 " \
            "px-4 py-2 text-sm"
        ) { plain "Create board" }
      end
    end
  end
end

