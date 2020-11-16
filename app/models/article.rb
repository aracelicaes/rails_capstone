class Article < ApplicationRecord
  validates :title,
            presence: true,
            length: { maximum: 100 }
  validates :text, presence: true
  validates :author, presence: true
  validates :category, presence: true
  # validates :image, presence: true

  has_one_attached :image
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :votes

  scope :most_voted, -> { joins(:votes).group('articles.id').order('votes.count DESC').limit(1) }

  # def self.most_voted_exists?
  #   if most_voted.present?
  #     most_voted.first
  #   else
  #     false
  #   end
  # end
end
