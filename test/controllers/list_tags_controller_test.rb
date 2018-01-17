require 'test_helper'

class ListTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list_tag = list_tags(:one)
  end

  test "should get index" do
    get list_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_list_tag_url
    assert_response :success
  end

  test "should create list_tag" do
    assert_difference('ListTag.count') do
      post list_tags_url, params: { list_tag: { deleted_at: @list_tag.deleted_at, list_item_id: @list_tag.list_item_id, tag_id: @list_tag.tag_id } }
    end

    assert_redirected_to list_tag_url(ListTag.last)
  end

  test "should show list_tag" do
    get list_tag_url(@list_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_tag_url(@list_tag)
    assert_response :success
  end

  test "should update list_tag" do
    patch list_tag_url(@list_tag), params: { list_tag: { deleted_at: @list_tag.deleted_at, list_item_id: @list_tag.list_item_id, tag_id: @list_tag.tag_id } }
    assert_redirected_to list_tag_url(@list_tag)
  end

  test "should destroy list_tag" do
    assert_difference('ListTag.count', -1) do
      delete list_tag_url(@list_tag)
    end

    assert_redirected_to list_tags_url
  end
end
