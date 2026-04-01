# app/components/table.rb
require_relative "base"

module Components
  class Table < Base
    prop :rows,    _Array(_Any)
    prop :caption, _Nilable(String), default: nil

    def after_initialize
      @columns = []
    end

    def view_template(&)
      vanish(&)

      table do
        caption { @caption } if @caption
        thead do
          tr do
            @columns.each { |col| th { col[:header] } }
          end
        end
        tbody do
          @rows.each do |row|
            tr do
              @columns.each do |col|
                td { col[:content][row].to_s }
              end
            end
          end
        end
      end
    end

    def column(header, &content)
      @columns << { header:, content: }
      nil
    end
  end
end