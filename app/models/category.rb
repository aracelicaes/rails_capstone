class Category < ApplicationRecord
  has_many :articles, -> { order 'created_at DESC' }

  validates :name,
            uniqueness: true,
            presence: true,
            length: { in: 3..25 }
  validates :priority,
            presence: true,
            numericality: { only_integer: true }
end
