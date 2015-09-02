module ButtonsFor
  module ButtonsForHelper

    def buttons_for(object, &block)
      capture ButtonsForBuilder.new(object, self), &block
    end

    class ButtonsForBuilder
      include ActionView::Helpers

      attr_reader :object, :template

      def initialize(object, template)
        @object, @template = object, template
      end

      def button(text, url, options = {}, &block)
        link_to label(text), url, class: classes(options)
      end

      private

      def label(text)
        text.capitalize
      end

      def classes(options)
        "btn".tap do |s|
        end
      end
    end

  end
end
