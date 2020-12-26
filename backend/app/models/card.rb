class Card < ApplicationRecord
    belongs_to :swim_lane
    belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
end
