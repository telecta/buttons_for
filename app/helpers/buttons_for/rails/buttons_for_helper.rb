module ButtonsFor
  module Rails
    module ButtonsForHelper

      def buttons_for(options = {}, &block)
        raise ArgumentError, "Missing block" unless block_given?

        capture ButtonsForBuilder.new(self), &block
      end

      class ButtonsForBuilder
        include ActionView::Helpers
        include FontAwesome::Rails::IconHelper

        attr_accessor :template, :output_buffer

        def initialize(template)
          @template = template
        end

        def button(text, url, options = {}, &block)
          icon_options = extract_icon_options!(options)

          link_to label(text, icon_options), url, options.merge(
            class: classes(options),
            title: t(text),
          )
        end

        def new(url, options = {})
          options[:label] ||= label(:new)

          button options[:label], url, options.reverse_merge(
            icon: 'plus',
            class: 'btn-success'
          )
        end

        def edit(url, options = {})
          options[:label] ||= label(:edit)

          button options[:label], url, options.reverse_merge(
            class: 'btn-default',
            icon: 'pencil'
          )
        end

        def export(url, options = {})
          options[:label] ||= label(:export)

          button options[:label], url, options.reverse_merge(
            class: 'btn-default',
            icon: 'file-text-o'
          )
        end

        def delete(url, options = {})
          options[:label] ||= label(:delete)

          button options[:label], url, options.reverse_merge(
            class: 'btn-danger',
            icon: 'trash-o',
            method: :delete,
            data: {
              confirm: t(:confirm)
            }
          )
        end

        def dropdown(text, options = {}, &block)
          raise ArgumentError, "Missing block" unless block_given?

          icon_options = extract_icon_options!(options)

          content_tag(:div, class: "btn-group") do
            concat(content_tag(:button, label(text), class: "btn btn-default dropdown-toggle", data: {toggle: "dropdown"}, aria: {haspopup: "true", expanded: "false"}) do
              "#{label(text, icon_options)} #{content_tag(:span, '', class: "caret")}".html_safe
            end)
            concat(content_tag(:ul, class: "dropdown-menu", "aria-labelledby" => text) do
              concat template.capture(&block)
            end)
          end
        end

        def link(text, path, options = {})
          options[:title] ||= label(text)

          icon_options = extract_icon_options!(options)

          content_tag(:li, link_to(label(text, icon_options), path, options))
        end

        private

        def extract_icon_options!(options)
          {}.tap do |icon_options|
            icon_options[:icon] = options.delete(:icon) if options.key?(:icon)
          end
        end

        def t(string)
          I18n.t("buttons_for.#{string.to_s}", default: string.to_s.titleize)
        end

        def label(text, options = {})
          label = text.is_a?(String) ? text : t(text)

          if options[:icon]
            fa_icon(options[:icon], text: label)
          else
            label
          end
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
