require 'test_helper'

class SwimLanesControllerTest < ActionDispatch::IntegrationTest
    setup { @swim_lane = swim_lanes(:one) }

    test 'should get index' do
        get swim_lanes_url, as: :json
        assert_response :success
    end

    test 'should create swim_lane' do
        assert_difference('SwimLane.count') do
            post swim_lanes_url,
                 params: {
                     swim_lane: {
                         board_id: @swim_lane.board_id,
                         name: @swim_lane.name,
                         user_id: @swim_lane.owner.id
                     }
                 },
                 as: :json
        end

        assert_response 201
    end

    test 'should show swim_lane' do
        get swim_lane_url(@swim_lane), as: :json
        assert_response :success
    end

    test 'should update swim_lane' do
        patch swim_lane_url(@swim_lane),
              params: {
                  swim_lane: {
                      board_id: @swim_lane.board_id,
                      name: @swim_lane.name,
                      user_id: @swim_lane.owner.id
                  }
              },
              as: :json
        assert_response 200
    end

    test 'should destroy swim_lane' do
        assert_difference('SwimLane.count', -1) do
            delete swim_lane_url(@swim_lane), as: :json
        end

        assert_response 204
    end
end
