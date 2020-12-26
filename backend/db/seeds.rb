# Gernereate new users, Boards, Swimlanes,
#  and Cards, as well as associate all of them
require 'faker'

BoardUser.destroy_all
Card.destroy_all
SwimLane.destroy_all
Board.destroy_all
User.destroy_all

require 'faker'

Faker::Name.name

#=> "kirsten.greenholt@corkeryfisher.info"
@users = []
30.times do |i|
    @users <<
        User.create(
            name: Faker::Name.name,
            username: Faker::Internet.username,
            email: Faker::Internet.email
        )
end
@boards = []
@users.each do |user|
    2.times do
        @boards <<
            Board.create(
                name: Faker::App.name,
                description:
                    Faker::Lorem.sentence(
                        word_count: 3,
                        supplemental: false,
                        random_words_to_add: 15
                    ),
                owner: user,
                collaborators: @users.sample(3)
            )
    end
end

@swim_lanes = []
@boards.map do |board|
    @swim_lanes <<
        SwimLane.create(
            name: 'To Do', board: board, owner: board.collaborators.sample
        )
    @swim_lanes <<
        SwimLane.create(
            name: 'Doing', board: board, owner: board.collaborators.sample
        )
    @swim_lanes <<
        SwimLane.create(
            name: 'Done', board: board, owner: board.collaborators.sample
        )
end

@cards = []
@swim_lanes.each do |swim_lane|
    collaborators = swim_lane.board.collaborators
    @cards <<
        Card.create(
            name: 'Feature 1',
            content:
                Faker::Lorem.sentence(
                    word_count: 3, supplemental: false, random_words_to_add: 8
                ),
            swim_lane: swim_lane,
            owner: collaborators.sample
        )
    @cards <<
        Card.create(
            name: 'Feature 2',
            content:
                Faker::Lorem.sentence(
                    word_count: 3, supplemental: false, random_words_to_add: 8
                ),
            swim_lane: swim_lane,
            owner: collaborators.sample
        )
    @cards <<
        Card.create(
            name: 'Feature 3',
            content:
                Faker::Lorem.sentence(
                    word_count: 3, supplemental: false, random_words_to_add: 8
                ),
            swim_lane: swim_lane,
            owner: collaborators.sample
        )
end # Associates users (owners) and boards
