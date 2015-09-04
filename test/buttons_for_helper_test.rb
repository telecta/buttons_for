require "test_helper"

class ButtonsFor::Rails::ButtonsForHelperTest < ActionView::TestCase

  test "#button" do
    assert_equal "<a class=\"btn\" title=\"Nuevo\" href=\"#\">Nuevo</a>", buttons_for(Object.new) { |b| b.button "Nuevo", "#" }
  end

  test "#new" do
    assert_equal "<a class=\"btn btn-success\" title=\"Nuevo\" href=\"#\">" +
      "<i class=\"fa fa-plus\"></i> Nuevo" +
    "</a>", buttons_for(Object.new) { |b| b.new "#" }
  end

  test "#edit" do
    assert_equal "<a class=\"btn\" title=\"Editar\" href=\"#\">" +
      "<i class=\"fa fa-pencil\"></i> Editar" +
    "</a>", buttons_for(Object.new) { |b| b.edit("#") }
  end

  test "#delete" do
    assert_equal "<a class=\"btn btn-danger\" data-confirm=\"¿Estas seguro?\" title=\"Borrar\" rel=\"nofollow\" data-method=\"delete\" href=\"#\">" +
      "<i class=\"fa fa-trash-o\"></i> Borrar" +
    "</a>", buttons_for(Object.new) { |b| b.delete("#") }
  end

end
