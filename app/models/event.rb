class Event < ApplicationRecord
  validates :start_date, :duration, :title, :description, :price, :location, presence: :true
  validates :title, length: { in: 5..140}
  validates :description, length: { in: 20..1000 }
  belongs_to :admin, class_name: 'User'
  has_many :participations
  has_many :participants, through: :participations, class_name: 'User'

  end