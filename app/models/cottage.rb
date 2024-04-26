class Cottage < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, :address, :description, :price, :availability, presence: true
end
