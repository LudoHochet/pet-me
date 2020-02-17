class Pet < ApplicationRecord
  SPECIES = ['cat', 'dog', 'mouse', 'crocodile', 'monkey', 'cow', 'hen', 'goose']
  has_many_attached :photos
  validates :name, presence: true
  validates :description, presence: true
  validates :species, presence: true, inclusion: { in: SPECIES }
  validates :price, presence: true
  validates :photo, presence: true
end
