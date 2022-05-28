class Activity < ApplicationRecord
  CATEGORY = %w(land sea virtual)
  belongs_to :user
end
