# app/views/boards/show.rb
class Views::Boards::Show < Views::Base
  def page_title = @board.name

  def initialize(board:, policy:)
    @board = board
    @policy = policy
  end

  def view_template
    turbo_stream_from @board

    render_header
    render_board
  end

  private

  def render_header
    Breadcrumb() do |b|
      b.item "Boards", url: boards_path
      b.item @board.name
    end

    div(class: "flex items-center justify-between mt-4 mb-6") do
      h1(class: "text-2xl font-bold text-text") { @board.name }
      div(class: "flex items-center gap-3") do
        MemberAvatars(board: @board)
        PresenceBar(board: @board)
        Link(label: "Members", href: board_members_path(@board),
             variant: :secondary) if @policy.manage_members?
        render_board_actions
      end
    end
  end

  def render_board_actions
    return unless @policy.edit_board?
    Dropdown(label: "Board actions", align: :right) do |d|
      d.item "Edit board",   url: edit_board_path(@board)
      d.item "Delete board", url: board_path(@board), method: :delete if @policy.delete_board?
    end
  end

  def render_board
    div(
      id:    dom_id(@board),
      class: "flex gap-4 overflow-x-auto pb-4",
      data:  {
        controller:              "board",
        board_cards_url_value:   cards_positions_path,
        board_columns_url_value: columns_positions_path
      }
    ) do
      @board.columns.ordered.each do |column|
        KanbanColumn(column: column, policy: @policy)
      end
      render_add_column if @policy.manage_columns?
    end
  end

  def render_add_column
    div(
      class: "w-72 shrink-0",
      data:  { controller: "column-form" }
    ) do
      button(
        type:  "button",
        class: "flex items-center gap-2 text-sm text-text-muted " \
          "hover:text-text bg-surface-alt/50 rounded-lg p-3 " \
          "border-2 border-dashed border-border w-full " \
          "hover:border-border-strong",
        data:  {
          column_form_target: "display",
          action:             "click->column-form#showForm"
        }
      ) do
        plain "+ Add column"
      end

      div(
        hidden: true,
        class:  "bg-surface-alt/50 rounded-lg p-3 border-2 border-dashed border-border",
        data:   { column_form_target: "form" }
      ) do
        render Views::Columns::ColumnForm.new(
          column: @board.columns.build,
          board:  @board
        )
      end
    end
  end
end