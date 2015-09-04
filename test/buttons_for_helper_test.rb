require "test_helper"

class ButtonsFor::Rails::ButtonsForHelperTest < ActionView::TestCase

  def with_concat_buttons_for(*args, &block)
    concat buttons_for(*args, &block)
  end

  test "#button" do
    with_concat_buttons_for(Object.new) { |b| b.button "Nuevo", "#" }
    assert_select "a.btn[href=\"#\"][title=\"Nuevo\"]", text: "Nuevo"
  end

  test "#new" do
    with_concat_buttons_for(Object.new) { |b| b.new "#" }
    assert_select "a.btn.btn-success[href=\"#\"][title=\"Nuevo\"]", text: "Nuevo" do |element|
      assert_select element, "i.fa.fa-plus"
    end
  end

  test "#edit" do
    with_concat_buttons_for(Object.new) { |b| b.edit "#" }
    assert_select "a.btn.btn[href=\"#\"][title=\"Editar\"]", text: "Editar" do |element|
      assert_select element, "i.fa.fa-pencil"
    end
  end

  test "#delete" do
    with_concat_buttons_for(Object.new) { |b| b.delete "#" }
    assert_select "a.btn.btn[href=\"#\"][title=\"Borrar\"][data-confirm=\"¿Estas seguro?\"]", text: "Borrar" do |element|
      assert_select element, "i.fa.fa-trash-o"
    end
  end

end
