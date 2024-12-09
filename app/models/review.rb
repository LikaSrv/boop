class Review < ApplicationRecord

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true

  belongs_to :appointment
end
