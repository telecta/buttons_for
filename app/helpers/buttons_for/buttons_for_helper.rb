module ButtonsFor
  module ButtonsForHelper

    def buttons_for(object, &block)
      capture ButtonsForBuilder.new(object, self), &block
    end

    class ButtonsForBuilder
      include ActionView::Helpers

      attr_accessor :object, :template, :output_buffer

      def initialize(object, template)
        @object, @template = object, template
      end

      def button(text, url, options = {}, &block)
        link_to label(text), url, class: classes(options), title: label(text)
      end

      def new(url, options = {}, &block)
        options[:class] ||= "btn-success"
        link_to url, class: classes(options), title: label(:new) do
          content_tag(:span, '', class: "fa fa-plus") + " " + label(:new)
        end
      end

      def edit(url, options = {}, &block)
        link_to url, class: classes(options), title: label(:edit) do
          content_tag(:span, '', class: "fa fa-pencil") + " " + label(:edit)
        end
      end

      def delete(url, options = {}, &block)
        options[:class] ||= "btn-danger"
        link_to url, class: classes(options), method: :delete, :"data-confirm" => t(:confirm), title: label(:delete) do
          content_tag(:span, '', class: "fa fa-trash-o") + " " + label(:delete)
        end
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
