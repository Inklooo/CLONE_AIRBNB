class Cottage < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, :address, :description, :price, :availability, presence: true

  before_validation :set_default_availability, on: :create

  private

  def set_default_availability
    self.availability ||= true
  end
end
