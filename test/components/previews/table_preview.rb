# test/components/previews/table_preview.rb
PREVIEW_PEOPLE = [
  { name: "Alice", role: "Admin"  },
  { name: "Bob",   role: "Member" },
  { name: "Carol", role: "Member" },
].freeze


class TablePreview < Lookbook::Preview
  def default
    render Components::Table.new(rows: PREVIEW_PEOPLE) { |t|
      t.column("Name") { |row| row[:name] }
      t.column("Role") { |row| row[:role] }
    }
  end

  def with_caption
    render Components::Table.new(
      rows:    PREVIEW_PEOPLE,
      caption: "Team members"
    ) { |t|
      t.column("Name") { |row| row[:name] }
      t.column("Role") { |row| row[:role] }
    }
  end

  def with_actions
    render Components::Table.new(rows: PREVIEW_PEOPLE) { |t|
      t.column("Name") { |row| row[:name] }
      t.column("Role") { |row| row[:role] }
      t.actions do |row|
        a(href: "#", class: "text-blue-600 hover:underline mr-3") { "Edit" }
        a(href: "#", class: "text-red-600 hover:underline")       { "Delete" }
      end
    }
  end

  def empty
    render Components::Table.new(rows: []) { |t|
      t.column("Name") { |row| row[:name] }
      t.column("Role") { |row| row[:role] }
    }
  end
end
