require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#Associations' do
    it { should have_many(:articles) }
  end

  describe '#Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_length_of(:name).is_at_most(25) }
    it { should validate_presence_of(:priority) }
    it { should validate_numericality_of(:priority).only_integer }
  end
end
