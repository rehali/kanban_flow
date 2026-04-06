# app/components/member_avatars.rb
class Components::MemberAvatars < Components::Base
  prop :board,          ::Board
  prop :online_ids,     _Array(_Any), default: -> { [] }

  def view_template
    div(
      class: "flex items-center gap-1",
      data:  {
        controller:              "presence",
        presence_board_id_value: @board.id.to_s
      }
    ) do
      @board.memberships.includes(:user).each do |membership|
        online = @online_ids.include?(membership.user_id)
        div(
          title: "#{membership.user.name}#{online ? " (online)" : ""}",
          class: "relative",
          data:  {
            presence_target:  "member",
            presence_user_id: membership.user_id
          }
        ) do
          Avatar(name: membership.user.name, size: :sm)
          if online
            span(
              class: "absolute bottom-0 right-0 block h-2.5 w-2.5 " \
                "rounded-full bg-success ring-2 ring-surface"
            )
          end
        end
      end
    end
  end
end