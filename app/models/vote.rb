class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article
  # Add Validations to ensure user_id and article_id is present vote
end
