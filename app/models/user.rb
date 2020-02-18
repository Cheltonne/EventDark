class User < ApplicationRecord
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  has_many :participations
  has_many :events, through: :participations
  has_many :administrated_events, class_name: 'Event', foreign_key: 'admin_id'  
end
