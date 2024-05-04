class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cottage

  validates :start_date, :end_date, presence: true
  before_validation :set_default_status, on: :create

  attr_accessor :date_range

  private

  def set_default_status
    self.status ||= "Pending"
  end
end
