# test/components/previews/empty_state_preview.rb
class EmptyStatePreview < Lookbook::Preview
  def message_only
    render Components::EmptyState.new(
      title:   "No results found",
      message: "Try adjusting your search or filters."
    )
  end
  def with_action
    render Components::EmptyState.new(
      title:        "No boards yet",
      message:      "Create your first board to get started.",
      action_label: "Create a board",
      action_url:   "#"
    )
  end
end
