class Article < ApplicationRecord
  validates :title,
            presence: true,
            length: { maximum: 100 }
  validates :text, presence: true
  validates :author, presence: true
  validates :category, presence: true
  validates :image, presence: true

  has_one_attached :image
  # create a scope includes(image_attachment: :blob)
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :votes

  # scope :most_voted, -> { order(total_votes: :desc).includes(:category) }
  # def total_votes
  #   votes.count
  # end

  # scope :by_score, :joins => :reviews, :group => "schools.id", :order => "AVG(reviews.score) DESC"

  #  scope :dry_clean_only, joins(:washing_instructions).where('washing_instructions.dry_clean_only = ?', true)

  # THESE ARE THE WORKING ONES RIGHT HERE!!!!!!
  # scope :most_voted, -> { joins(:votes).group('articles.id').order('votes.count DESC').includes(:category).limit(1) }
  scope :most_voted, -> { joins(:votes).group('articles.id').order('votes.count DESC').limit(1).first }
  # scope :latest_article, ->(categories) { joins(:category).where('categories.name' == '?', categories.name).last }


  # def total_votes
  #   votes.count
  # end

  # Vote.group(:article.id).count 
  # article1 , 20 votes 
  # Article, 10 


  # def self.total_votes(article)
  #   order('votes.count DESC')
  # end
end
