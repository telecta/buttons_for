require "test_helper"

class ButtonsFor::Rails::ButtonsForHelperTest < ActionView::TestCase

  test "#button" do
    with_concat_buttons_for(Object.new) { |b| b.button "New", "#" }
    assert_select "a.btn[href=\"#\"][title=\"New\"]", text: "New"
  end

  test "#new" do
    with_concat_buttons_for(Object.new) { |b| b.new "#" }
    assert_select "a.btn.btn-success[href=\"#\"][title=\"New\"]", text: "New" do |element|
      assert_select element, "i.fa.fa-plus"
    end
  end

  test "#edit" do
    with_concat_buttons_for(Object.new) { |b| b.edit "#" }
    assert_select "a.btn.btn[href=\"#\"][title=\"Edit\"]", text: "Edit" do |element|
      assert_select element, "i.fa.fa-pencil"
    end
  end

  test "#delete" do
    with_concat_buttons_for(Object.new) { |b| b.delete "#" }
    assert_select "a.btn.btn[href=\"#\"][title=\"Delete\"][data-confirm=\"Are you sure?\"]", text: "Delete" do |element|
      assert_select element, "i.fa.fa-trash-o"
    end
  end

  private

  def with_concat_buttons_for(*args, &block)
    concat buttons_for(*args, &block)
  end

end
