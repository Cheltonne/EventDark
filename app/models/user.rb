class User < ApplicationRecord
  has_many :participations
  has_many :events, through: :participations
  has_many :administrated_events, class_name: 'Event', foreign_key: 'admin_id'  
end
