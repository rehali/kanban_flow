class Components::Icon < Components::Base
  ICONS = {
    information_circle: { paths: ["M11.25 11.25l.041-.02a.75.75 0 011.059.852l-.708 2.836a.75.75 0 001.059.852l.041-.02M12 8.25h.008v.008H12V8.25zm9 3.75a9 9 0 11-18 0 9 9 0 0118 0z"] },
    check_circle:       { paths: ["M9 12.75l2.25 2.25L15 9.75m6 2.25a9 9 0 11-18 0 9 9 0 0118 0z"] },
    exclamation_triangle: { paths: ["M12 9v3.75m0 3.75h.008v.008H12v-.008zm-8.834 1.132l7.5-13a1.5 1.5 0 012.598 0l7.5 13A1.5 1.5 0 0119.464 21H4.536a1.5 1.5 0 01-1.299-2.25z"] },
    x_circle:           { paths: ["m9.75 9.75 4.5 4.5m0-4.5-4.5 4.5M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"] },
    x_mark:             { paths: ["M6 18L18 6M6 6l12 12"] },
  }.freeze

  prop :name,       Symbol
  prop :class_name, String, default: -> { "h-6 w-6" }

  def view_template
    svg(**svg_attributes) do |s|
      icon.fetch(:paths).each do |d|
        s.path(stroke_linecap: "round", stroke_linejoin: "round", d:)
      end
    end
  end

  private

  def icon
    ICONS.fetch(@name) do
      raise ArgumentError, "Unknown icon: #{@name.inspect}"
    end
  end

  def svg_attributes
    {
      xmlns:        "http://www.w3.org/2000/svg",
      fill:         "none",
      viewBox:      "0 0 24 24",
      stroke_width: "1.5",
      stroke:       "currentColor",
      class:        @class_name,
      aria_hidden:  "true"
    }
  end
end