class Event < ApplicationRecord
  validates :start_date, :duration, :title, :description, :price, :location, presence: :true
  validate :cant_be_past
  validate :duration_5_pos
  validates :title, length: { in: 5..140}
  validates :description, length: { in: 20..1000 }
  validate :price_validation
  belongs_to :admin, class_name: 'User'
  has_many :participations
  has_many :users, through: :participations

  private 
  
  def cant_be_past
    errors.add(:start_date, "can\'t be past") if start_date < Time.now
  end
  
  def duration_5_pos
    errors.add(:duration, "has to be a multiple of 5") unless duration % 5 == 0
    errors.add(:duration, "has to be a positive amount of minutes") unless duration > 0
  end

  def price_validation
    errors.add(:price, "can\'t be free") if price < 1
    errors.add(:price, "can\'t be over 1000") if price > 1000
  end
end
