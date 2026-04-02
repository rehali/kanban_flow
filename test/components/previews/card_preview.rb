# test/components/previews/card_preview.rb
class CardPreview < Lookbook::Preview
  def title_only
    render Components::Card.new(title: "Card title") {
      p { "Just a body." }
    }
  end
  def full_slots
    render Components::Card.new { |card|
      card.header { "Custom header" }
      card.body   { "Card body content." }
      card.footer { "Footer content" }
    }
  end
end
