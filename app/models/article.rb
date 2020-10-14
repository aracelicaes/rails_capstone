class Article < ApplicationRecord
  validates :title,
            presence: true,
            length: { maximum: 100 }
  validates :text, presence: true
  validates :author, presence: true

  belongs_to :author, class_name: 'User'
  has_many :votes
end
