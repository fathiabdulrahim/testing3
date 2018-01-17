require "application_system_test_case"

class ListTagsTest < ApplicationSystemTestCase
  setup do
    @list_tag = list_tags(:one)
  end

  test "visiting the index" do
    visit list_tags_url
    assert_selector "h1", text: "List Tags"
  end

  test "creating a List tag" do
    visit list_tags_url
    click_on "New List Tag"

    fill_in "Deleted At", with: @list_tag.deleted_at
    fill_in "List Item", with: @list_tag.list_item_id
    fill_in "Tag", with: @list_tag.tag_id
    click_on "Create List tag"

    assert_text "List tag was successfully created"
    click_on "Back"
  end

  test "updating a List tag" do
    visit list_tags_url
    click_on "Edit", match: :first

    fill_in "Deleted At", with: @list_tag.deleted_at
    fill_in "List Item", with: @list_tag.list_item_id
    fill_in "Tag", with: @list_tag.tag_id
    click_on "Update List tag"

    assert_text "List tag was successfully updated"
    click_on "Back"
  end

  test "destroying a List tag" do
    visit list_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "List tag was successfully destroyed"
  end
end
