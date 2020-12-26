require 'test_helper'

class BoardUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_user = board_users(:one)
  end

  test "should get index" do
    get board_users_url, as: :json
    assert_response :success
  end

  test "should create board_user" do
    assert_difference('BoardUser.count') do
      post board_users_url, params: { board_user: { board_id: @board_user.board_id, user_id: @board_user.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show board_user" do
    get board_user_url(@board_user), as: :json
    assert_response :success
  end

  test "should update board_user" do
    patch board_user_url(@board_user), params: { board_user: { board_id: @board_user.board_id, user_id: @board_user.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy board_user" do
    assert_difference('BoardUser.count', -1) do
      delete board_user_url(@board_user), as: :json
    end

    assert_response 204
  end
end
