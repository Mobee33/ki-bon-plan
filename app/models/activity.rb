class Activity < ApplicationRecord
  CATEGORY = %w(land sea virtual)
  belongs_to :user

  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
