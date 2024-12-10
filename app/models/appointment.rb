class Appointment < ApplicationRecord
  validates :date, :start_time, :end_time, presence: true

  belongs_to :professional
  belongs_to :user

  has_one :review, dependent: :destroy
end
