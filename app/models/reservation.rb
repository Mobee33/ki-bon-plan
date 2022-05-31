class Reservation < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  validates :number_of_people, inclusion: { in: %w(10..50)} , numericality: true
end
