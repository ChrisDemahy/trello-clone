class SwimLane < ApplicationRecord
    belongs_to :board
    belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
    has_many :cards, dependent: :destroy
end
