require 'test_helper'

class FrazesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fraze = frazes(:one)
  end

  test "should get index" do
    get frazes_url
    assert_response :success
  end

  test "should get new" do
    get new_fraze_url
    assert_response :success
  end

  test "should create fraze" do
    assert_difference('Fraze.count') do
      post frazes_url, params: { fraze: { body: @fraze.body } }
    end

    assert_redirected_to fraze_url(Fraze.last)
  end

  test "should show fraze" do
    get fraze_url(@fraze)
    assert_response :success
  end

  test "should get edit" do
    get edit_fraze_url(@fraze)
    assert_response :success
  end

  test "should update fraze" do
    patch fraze_url(@fraze), params: { fraze: { body: @fraze.body } }
    assert_redirected_to fraze_url(@fraze)
  end

  test "should destroy fraze" do
    assert_difference('Fraze.count', -1) do
      delete fraze_url(@fraze)
    end

    assert_redirected_to frazes_url
  end
end
