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
          "<a class=\"btn btn-success\" title=\"Nuevo\" href=\"#\">" +
            "<span class=\"fa fa-plus\"></span> Nuevo" +
          "</a>"
        )
      end
    end

    describe "#edit" do
      it "generates a edit button" do
        store_translations(:en, buttons_for: {edit: "Editar"})

        expect(builder.edit("#")).to eq(
          "<a class=\"btn\" title=\"Editar\" href=\"#\">" +
            "<span class=\"fa fa-pencil\"></span> Editar" +
          "</a>"
        )
      end
    end

    describe "#delete" do
      it "generates a delete button with a confirm propmt" do
        store_translations(:en, buttons_for: {delete: "Borrar", confirm: "¿Estas seguro?"})

        expect(builder.delete("#")).to eq(
          "<a class=\"btn btn-danger\" confirm=\"¿Estas seguro?\" title=\"Borrar\" rel=\"nofollow\" data-method=\"delete\" href=\"#\">" +
            "<span class=\"fa fa-trash-o\"></span> Borrar" +
          "</a>"
        )
      end
    end
  end

  def store_translations(locale, translations)
    I18n.backend.store_translations locale, translations
  end

end
