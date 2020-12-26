class User < ApplicationRecord
    has_many :cards, dependent: :destroy
    has_many :swim_lanes, dependent: :destroy
    has_many :boards, dependent: :destroy
    has_many :board_users, dependent: :destroy
    has_many :collaborations, through: :board_users, source: :board
end
