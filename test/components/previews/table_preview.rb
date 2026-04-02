# test/components/previews/table_preview.rb
PREVIEW_PEOPLE = [
  { name: "Alice", role: "Admin"  },
  { name: "Bob",   role: "Member" },
  { name: "Carol", role: "Member" },
].freeze
class TablePreview < Lookbook::Preview
  def default
    render Components::Table.new(rows: PREVIEW_PEOPLE).tap { |t|
      t.column("Name") { |row| row[:name] }
      t.column("Role") { |row| row[:role] }
    }
  end
  def with_caption
    render Components::Table.new(
      rows:    PREVIEW_PEOPLE,
      caption: "Team members"
    ).tap { |t|
      t.column("Name") { |row| row[:name] }
      t.column("Role") { |row| row[:role] }
    }
  end
end
