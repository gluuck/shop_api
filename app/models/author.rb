class Author < ApplicationRecord
  has_many :sends, dependent: :destroy
  has_many :shops, through: :sends, dependent: :destroy
  has_many :books, dependent: :destroy
end
