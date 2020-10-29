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
  scope :category_with_articles_votes, -> { ordered_categs.includes(articles: [{ image_attachment: :blob }, :votes]) }
  scope :categs_articles_info, -> { categories_with_articles.limit(4).pluck(:name, 'articles.title, articles.image') }
  # scope :latest_article, ->(categories) { joins(:category).where('categories.name' == '?', categories.name).last }
end
