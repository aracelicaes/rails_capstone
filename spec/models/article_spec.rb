require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:category) }
    it { should have_many(:votes) }
    it { should have_one_attached(:image) }
  end

  describe '#Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(100) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:category) }
  end
end
