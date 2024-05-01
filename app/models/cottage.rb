class Cottage < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  belongs_to :user
  validates :name, :address, :description, :price, :availability, presence: true
  geocoded_by :address

  before_validation :set_default_availability, on: :create
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def set_default_availability
    self.availability ||= true
  end
end
