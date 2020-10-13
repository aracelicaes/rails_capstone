class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :title,
            presence: true,
            length: { maximum: 100 }
  validates :text, presence: true
  validates :author, presence: true
end
