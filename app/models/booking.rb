class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  validates :status, default: false
  validates :start_date, presence: true
  validates :end_date, presence: true
end
