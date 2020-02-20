class Pet < ApplicationRecord
  SPECIES = ['cat', 'dog', 'mouse', 'crocodile', 'monkey', 'cow', 'hen', 'goose', 'rabbit']
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true
  validates :species, presence: true, inclusion: { in: SPECIES }
  validates :price, presence: true
end
