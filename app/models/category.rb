class Category < ApplicationRecord
  has_many :articles, -> { order 'created_at DESC' }

  validates :name,
            uniqueness: { case_sensitive: false },
            presence: true,
            length: { in: 3..25 }
  validates :priority,
            presence: true,
            numericality: { only_integer: true }

  scope :ordered_categs, -> { order(priority: :asc) }
  scope :categories_with_articles, -> { ordered_categs.includes(articles: [image_attachment: :blob]) }
  scope :categs_articles_info, -> { categories_with_articles.limit(4).pluck(:name, 'articles.title, articles.image') }
end
