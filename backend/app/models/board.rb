class Board < ApplicationRecord
    belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
    has_many :board_users, dependent: :destroy
    has_many :swim_lanes, dependent: :destroy
    has_many :collaborators, through: :board_users, source: :user
end
