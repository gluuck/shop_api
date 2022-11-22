class Shop < ApplicationRecord
  has_many :sends, dependent: :destroy
  has_many :authors, through: :sends, dependent: :destroy
end
