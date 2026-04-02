# test/components/previews/avatar_preview.rb
class AvatarPreview < Lookbook::Preview
  def initials
    render Components::Avatar.new(name: "Alice Smith")
  end
  def small
    render Components::Avatar.new(name: "Alice Smith", size: :sm)
  end
  def large
    render Components::Avatar.new(name: "Alice Smith", size: :lg)
  end
  def with_image
    render Components::Avatar.new(
      name:      "Alice Smith",
      image_url: "https://i.pravatar.cc/150?u=alice"
    )
  end
end
