# app/components/error_summary.rb
class Components::ErrorSummary < Components::Base
  prop :errors, _Any

  def view_template
    return unless @errors.any?

    div(
      class: "rounded-md bg-danger/10 border border-danger/30 p-4",
      role:  "alert"
    ) do
      p(class: "text-sm font-medium text-danger mb-2") do
        plain "Please fix the following errors:"
      end
      ul(class: "list-disc list-inside text-sm text-danger space-y-1") do
        @errors.full_messages.each { |msg| li { msg } }
      end
    end
  end

end
