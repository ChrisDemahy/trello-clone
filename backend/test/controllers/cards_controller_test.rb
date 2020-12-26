require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
    setup { @card = cards(:one) }

    test 'should get index' do
        get cards_url, as: :json
        assert_response :success
    end

    test 'should create card' do
        assert_difference('Card.count') do
            post cards_url,
                 params: {
                     card: {
                         content: @card.content,
                         name: @card.name,
                         swim_lane_id: @card.swim_lane_id,
                         user_id: @card.owner.id
                     }
                 },
                 as: :json
        end

        assert_response 201
    end

    test 'should show card' do
        get card_url(@card), as: :json
        assert_response :success
    end

    test 'should update card' do
        patch card_url(@card),
              params: {
                  card: {
                      content: @card.content,
                      name: @card.name,
                      swim_lane_id: @card.swim_lane_id,
                      user_id: @card.owner.id
                  }
              },
              as: :json
        assert_response 200
    end

    test 'should destroy card' do
        assert_difference('Card.count', -1) do
            delete card_url(@card), as: :json
        end

        assert_response 204
    end
end
