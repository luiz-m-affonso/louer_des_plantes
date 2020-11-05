class Plant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
  belongs_to :user
  validates :common_name, presence: true
  validates :scientific_name, presence: true
  validates :family, presence: true
  validates :price, presence: true
  validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_names_and_family,
    against: [ :common_name, :scientific_name, :family ],
    using: {
      tsearch: { prefix: true }
    }
end
