class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :telephone, presence: true
  validates :description, presence: true
  validates :email, uniqueness: true
end
