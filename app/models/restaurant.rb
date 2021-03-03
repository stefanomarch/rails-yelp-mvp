class Restaurant < ApplicationRecord
  CATEGORIES = ['chinese', 'italian', 'japanese', 'french', 'belgian'].freeze
  has_many :reviews, dependent: :destroy

  validates :name, :address, :category, presence: true
  validates :category, acceptance: { accept: CATEGORIES }
end
