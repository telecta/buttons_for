module ButtonsFor
  module Rails
    module ButtonsForHelper

      def buttons_for(object, &block)
        raise ArgumentError, "Missing block" unless block_given?

        capture ButtonsForBuilder.new(object, self), &block
      end

      class ButtonsForBuilder
        include ActionView::Helpers
        include FontAwesome::Rails::IconHelper

        attr_accessor :object, :template, :output_buffer

        def initialize(object, template)
          @object, @template = object, template
        end

        def button(text, url, options = {}, &block)
          options[:class] = classes(options)
          options[:title] = t(text)

          label = text.is_a?(String) ? text : t(text)

          content = if options[:icon]
            fa_icon options.delete(:icon), text: label
          else
            label
          end

          link_to content, url, options
        end

        def new(url, options = {}, &block)
          options[:class] ||= "btn-success"
          options[:label] ||= label(:new)
          options[:icon] ||= "plus"

          button options[:label], url, options
        end

        def edit(url, options = {}, &block)
          options[:class] ||= "btn-default"
          options[:label] ||= label(:edit)
          options[:icon] ||= "pencil"

          button options[:label], url, options
        end

        def delete(url, options = {}, &block)
          options[:class] ||= "btn-danger"
          options[:label] ||= label(:delete)
          options[:icon]  ||= "trash-o"
          options[:method] = :delete
          options["data-confirm"] = t(:confirm)

          button options[:label], url, options
        end

        def dropdown(text, options = {}, &block)
          raise ArgumentError, "Missing block" unless block_given?

          content_tag(:div, class: "btn-group") do
            concat(content_tag(:button, label(text), class: "btn btn-default dropdown-toggle", data: {toggle: "dropdown"}, aria: {haspopup: "true", expanded: "false"}) do
              "#{label(text)} #{content_tag(:span, '', class: "caret")}".html_safe
            end)
            concat(content_tag(:ul, class: "dropdown-menu", "aria-labelledby" => text) do
              concat template.capture(&block)
            end)
          end
        end

        def link(text, path, options = {})
          options[:title] ||= label(text)

          content = if options[:icon]
            fa_icon(options.delete(:icon), text: label(text))
          else
            label(text)
          end

          content_tag(:li) { link_to(content, path, options) }
        end

        private

        def prepare_text(text, icon)
          icon.nil? ? label(text) : fa_icon(icon, text: label(text))
        end

        def t(string)
          I18n.t("buttons_for.#{string.to_s}", default: string.to_s.titleize)
        end

        def label(text)
          text.is_a?(String) ? text : t(text)
        end

        def classes(options)
          "btn".tap do |s|
            s << " #{options[:class]}" if options[:class]
          end
        end

        def protect_against_forgery?
          false
        end

      end
    end
  end
end
