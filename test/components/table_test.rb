# frozen_string_literal: true

require_relative "../component_test_helper"

PEOPLE = [
  { name: "Alice", role: "Admin"  },
  { name: "Bob",   role: "Member" },
].freeze

class TableTest < ActiveSupport::TestCase
  include ComponentTestHelper

  test "renders a table element" do
    html = Components::Table.new(rows: PEOPLE).call do |t|
      t.column("Name") { |row| row[:name] }
    end
    assert_includes html, "<table"
  end

  test "renders column headers" do
    html = Components::Table.new(rows: PEOPLE).call do |t|
      t.column("Name") { |row| row[:name] }
      t.column("Role") { |row| row[:role] }
    end
    assert_includes html, "Name"
    assert_includes html, "Role"
  end

  test "renders row data" do
    html = Components::Table.new(rows: PEOPLE).call do |t|
      t.column("Name") { |row| row[:name] }
      t.column("Role") { |row| row[:role] }
    end
    assert_includes html, "Alice"
    assert_includes html, "Admin"
    assert_includes html, "Bob"
    assert_includes html, "Member"
  end

  test "renders caption when provided" do
    html = Components::Table.new(rows: PEOPLE, caption: "Team").call do |t|
      t.column("Name") { |row| row[:name] }
    end
    assert_includes html, "Team"
    assert_includes html, "<caption"
  end

  test "no caption without prop" do
    html = Components::Table.new(rows: PEOPLE).call do |t|
      t.column("Name") { |row| row[:name] }
    end
    refute_includes html, "<caption"
  end

  test "wrong rows type raises" do
    assert_raises(Literal::TypeError) { Components::Table.new(rows: "not an array") }
  end
end
