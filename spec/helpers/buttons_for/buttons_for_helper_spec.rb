require "spec_helper"

describe ButtonsFor::ButtonsForHelper do
  describe ButtonsFor::ButtonsForHelper::ButtonsForBuilder do
    let(:object) { Struct.new(:name).new("Project 1") }

    def builder
      described_class.new(object, ActionView::Base.new)
    end

    describe "#button" do
      it "generates a default button" do
        store_translations(:en, buttons_for: {new: "Nuevo"})

        expect(builder.button("new", "#")).to eq(
          "<a class=\"btn\" title=\"Nuevo\" href=\"#\">Nuevo</a>"
        )
      end
    end

    describe "#new" do
      it "generates a new button" do
        store_translations(:en, buttons_for: {new: "Nuevo"})

        expect(builder.new("#")).to eq(
          "<a class=\"btn\" title=\"Nuevo\" href=\"#\">" +
            "<i class=\"fa fa-plus\">Nuevo</i>" +
          "</a>"
        )
      end
    end
  end

  def store_translations(locale, translations)
    I18n.backend.store_translations locale, translations
  end

end
