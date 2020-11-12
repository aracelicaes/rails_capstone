require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#Associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end

  describe '#Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_least(4) }
    it { should validate_length_of(:username).is_at_most(12) }
    it { should validate_presence_of(:email) }
    it { should allow_value('email@foo.com').for(:email).on(:create) }
  end
end
