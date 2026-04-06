# app/views/board_members/index.rb
class Views::BoardMembers::Index < Views::Base
  def page_title = "Members — #{@board.name}"

  def initialize(board:, memberships:, policy:)
    @board       = board
    @memberships = memberships
    @policy      = policy
  end

  def view_template
    Breadcrumb() do |b|
      b.item "Boards",    url: boards_path
      b.item @board.name, url: board_path(@board)
      b.item "Members"
    end

    div(class: "flex items-center justify-between mt-4 mb-6") do
      h1(class: "text-2xl font-bold text-text") { "Board members" }
    end

    render_invite_form
    render_members_list
  end

  private

  def render_invite_form
    Panel(title: "Add a member") do
      form_with(url: board_members_path(@board), class: "flex gap-3 items-end") do |f|
        div(class: "flex-1") do
          TextInput(
            form:        f,
            field:       :email,
            label:       "Email address",
            type:        "email",
            placeholder: "colleague@example.com"
          )
        end
        Button(label: "Add member", type: "submit")
      end
    end
  end

  def render_members_list
    Panel(title: "Current members") do
      div(class: "divide-y divide-border") do
        @memberships.each { |m| render_member_row(m) }
      end
    end
  end

  def render_member_row(membership)
    div(class: "flex items-center justify-between py-3") do
      div(class: "flex items-center gap-3") do
        Avatar(name: membership.user.name, size: :sm)
        div do
          p(class: "text-sm font-medium text-text") { membership.user.name }
          p(class: "text-xs text-text-muted") { membership.user.email }
        end
      end

      div(class: "flex items-center gap-3") do
        span(class: role_badge_classes(membership)) { membership.role.capitalize }

        unless membership.admin?
          form_with(
            url:    board_member_path(@board, membership),
            method: :delete
          ) do
            button(
              type:  "submit",
              class: "text-text-muted hover:text-danger p-1 rounded",
              data:  { turbo_confirm: "Remove #{membership.user.name}?" }
            ) do
              Icon(name: :x_mark, class_name: "h-4 w-4")
            end
          end
        end
      end
    end
  end

  def role_badge_classes(membership)
    base = "inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium"
    if membership.admin?
      "#{base} bg-primary/10 text-primary"
    else
      "#{base} bg-surface-alt text-text-muted"
    end
  end
end