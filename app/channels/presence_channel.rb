# app/channels/presence_channel.rb
class PresenceChannel < ApplicationCable::Channel
  def subscribed
    @board = Board.find(params[:board_id])
    stream_from "presence:#{@board.id}"
    add_presence
    # Send current state immediately to the new subscriber
    transmit({ members: current_presence.values })
  end

  def unsubscribed
    remove_presence
  end

  private

  def add_presence
    redis_key = "presence:#{@board.id}"
    members   = current_presence(redis_key)
    members[current_user.id.to_s] = {
      id:   current_user.id,
      name: current_user.name
    }
    store_presence(redis_key, members)
    broadcast_presence(members)
  end

  def remove_presence
    redis_key = "presence:#{@board.id}"
    members   = current_presence(redis_key)
    members.delete(current_user.id.to_s)
    store_presence(redis_key, members)
    broadcast_presence(members)
  end

  def current_presence(key)
    raw = Rails.cache.read(key)
    raw ? JSON.parse(raw) : {}
  end

  def store_presence(key, members)
    Rails.cache.write(key, members.to_json, expires_in: 24.hours)
  end

  def broadcast_presence(members)
    ActionCable.server.broadcast(
      "presence:#{@board.id}",
      { members: members.values }
    )
  end
end