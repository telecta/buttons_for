require "test_helper"

class ButtonsFor::Rails::ButtonsForHelperTest < ActionView::TestCase

  test "#buttons_for(object, &block)" do
    assert_raises(ArgumentError) { buttons_for(Object.new) }
  end

  test "#button" do
    with_concat_buttons_for(Object.new) { |b| b.button "New", "#" }
    assert_select "a.btn[href=\"#\"][title=\"New\"]", text: "New"
  end

  test "#button capitalize text if translation is symbol" do
    with_concat_buttons_for(Object.new) { |b| b.button :capitalized_text, "#" }
    assert_select "a.btn", text: "Capitalized Text"
  end

  test "#button uses the text directly if text is a string" do
    with_concat_buttons_for(Object.new) { |b| b.button "capitalized text", "#" }
    assert_select "a.btn", text: "capitalized text"
  end

  test "#button uses the translation if value exists for key" do
    store_translations(:en, buttons_for: {close: "Lukk"}) do
      with_concat_buttons_for(Object.new) { |b| b.button :close, "#" }
    end
    assert_select "a.btn", text: "Lukk"
  end

  test "#new" do
    with_concat_buttons_for(Object.new) { |b| b.new "#" }
    assert_select "a.btn.btn-success[href=\"#\"][title=\"New\"]", text: "New" do |element|
      assert_select element, "i.fa.fa-plus"
    end
  end

  test "#edit" do
    with_concat_buttons_for(Object.new) { |b| b.edit "#" }
    assert_select "a.btn.btn-default[href=\"#\"][title=\"Edit\"]", text: "Edit" do |element|
      assert_select element, "i.fa.fa-pencil"
    end
  end

  test "#delete" do
    with_concat_buttons_for(Object.new) { |b| b.delete "#" }
    assert_select "a.btn.btn[href=\"#\"][title=\"Delete\"][data-confirm=\"Are you sure?\"]", text: "Delete" do |element|
      assert_select element, "i.fa.fa-trash-o"
    end
  end

  test "#export" do
    with_concat_buttons_for(Object.new) { |b| b.export "#" }
    assert_select "a.btn.btn[href=\"#\"][title=\"Export\"]", text: "Export" do |element|
      assert_select element, "i.fa.fa-file-text-o"
    end
  end

  test "options[:label]" do
    with_concat_buttons_for(Object.new) { |b| b.new "#", label: "New Project" }
    assert_select "a", text: "New Project"
  end

  test "#dropdown with content generates at dropdown" do
    with_concat_buttons_for(Object.new) do |b|
      b.dropdown(:actions) { "content" }
    end
    assert_select "div.btn-group" do |btn_element|
      assert_select btn_element, "button.btn.btn-default.dropdown-toggle[data-toggle=\"dropdown\"][aria-haspopup=\"true\"][aria-expanded=\"false\"]", text: "Actions"
      assert_select btn_element, "span.caret"
      assert_select btn_element, "ul.dropdown-menu[aria-labelledby=\"actions\"]", text: "content"
    end
  end

  test "#dropdown options[:icon] prepends icon to label" do
    with_concat_buttons_for(Object.new) do |b|
      b.dropdown("New", icon: "plus") { "content" }
    end
    assert_select "i.fa.fa-plus"
  end

  test "#dropdown raises error of block is missing" do
    assert_raises(ArgumentError) do
      with_concat_buttons_for(Object.new) { |b| b.dropdown(:actions) }
    end
  end

  test "#link" do
    with_concat_buttons_for(Object.new)  { |b| b.link "text", "#" }
    assert_select "li a[href=\"#\"][title=\"text\"]", text: "text"
  end

  test "#link options[:icon]" do
    with_concat_buttons_for(Object.new) do |b|
      b.link "content", "#", icon: "shopping-cart"
    end

    assert_select "li a[href=\"#\"][title=\"content\"]"
  end

  private

  def store_translations(locale, translations, &block)
    I18n.backend.store_translations locale, translations
    yield
  ensure
    I18n.reload!
    I18n.backend.send :init_translations
  end

  def with_concat_buttons_for(*args, &block)
    concat buttons_for(*args, &block)
  end

end
