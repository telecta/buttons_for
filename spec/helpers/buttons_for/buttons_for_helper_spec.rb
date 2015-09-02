require "spec_helper"

describe ButtonsFor::ButtonsForHelper do
  describe ButtonsFor::ButtonsForHelper::ButtonsForBuilder do
    let(:object) { Struct.new(:name).new("Project 1") }

    def builder
      described_class.new(object, ActionView::Base.new)
    end

    describe "#button" do
      it "generates a default button" do
        expect(builder.button(:new, "#")).to eq(
          "<a class=\"btn\" href=\"#\">New</a>"
        )
      end
    end

  end
end
