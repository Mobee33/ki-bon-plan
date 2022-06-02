class Activity < ApplicationRecord
  CATEGORY = %w(land sea virtual)
  has_many_attached :photos
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :details, :category],
    associated_against: {
      user: [ :username, :email ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
