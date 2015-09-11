module ButtonsFor
  module Rails
    module ButtonsForHelper

      def buttons_for(object, &block)
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
          options[:title] = text

          label = if options[:icon]
            fa_icon options.delete(:icon), text: text
          else
            text
          end

          link_to label, url, options
        end

        def new(url, options = {}, &block)
          options[:class] ||= "btn-success"
          options[:label] ||= label(:new)
          options[:icon] ||= "plus"

          button options[:label], url, options
        end

        def edit(url, options = {}, &block)
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

        private

        def t(string)
          I18n.t("buttons_for.#{string.to_s}")
        end

        def label(text)
          t(text)
        end

        def classes(options)
          "btn".tap do |s|
            s << " #{options[:class]}" if options[:class]
          end
        end

      end
    end
  end
end
