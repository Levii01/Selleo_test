require 'rails_helper'

RSpec.describe Interest, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of :name}
    it { is_expected.to validate_presence_of :user}

    describe 'create new interest' do
      context 'when creating new interest' do
        subject { create :interest, name: 'Music'}
        it { expect(subject.reload.name).to eq('Music') }
      end

      context 'when creating intrest with valid params' do
        subject { create :interest }
        it { is_expected.to be_valid }
      end

      context 'when gender is not valid' do
        subject { build :interest, name: nil, user_id: nil }
        it { is_expected.to_not be_valid }
      end

      context 'when trying to create interest with empty user_id' do
        subject { build :interest, user_id: nil }
        it { is_expected.to_not be_valid }
      end

      context 'when trying to create interst with empty name' do
        subject { build :interest, name: nil }
        it { is_expected.to_not be_valid }
      end
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
  end
end
