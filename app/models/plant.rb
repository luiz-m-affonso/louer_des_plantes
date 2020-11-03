class Plant < ApplicationRecord
  belongs_to :user
  validates :common_name, presence: true
  validates :scientific_name, presence: true
  validates :family, presence: true
  validates :price, presence: true
  validates :address, presence: true
end
