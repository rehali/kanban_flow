# app/components/presence_bar.rb
class Components::PresenceBar < Components::Base
  prop :board,   ::Board
  prop :members, _Array(_Any), default: -> { [] }

  def view_template
    div(
      class: "flex items-center gap-1",
      data:  {
        controller:               "presence",
        presence_board_id_value:  @board.id.to_s
      }
    ) do
      @members.each do |member|
        div(
          title: member[:name] || member["name"],
          data:  { presence_target: "avatar" }
        ) do
          Avatar(name: member[:name] || member["name"], size: :sm)
        end
      end
    end
  end
end