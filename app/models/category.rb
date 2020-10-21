class Category < ApplicationRecord
  has_many :articles, -> { order 'created_at DESC' }

  validates :name,
            uniqueness: { case_sensitive: false },
            presence: true,
            length: { in: 3..25 }
  validates :priority,
            presence: true,
            numericality: { only_integer: true }

  scope :priority_categs, -> { order(priority: :asc) }
  scope :categories_with_articles, -> { priority_categs.includes(articles: [image_attachment: :blob]) }
  # scope :latest_article, ->(categories) { joins(:category).where('categories.name' == '?', categories.name).last }
end
