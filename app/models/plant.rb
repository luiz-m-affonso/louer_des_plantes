class Plant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user

  validates :common_name, presence: true
  validates :scientific_name, presence: true
  validates :family, presence: true
  validates :image_url, presence: true
  validates :price, presence: true
  validates :address, presence: true
end
