require 'rails_helper'

RSpec.describe User, type: :model do
  require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

  describe 'create new user' do
    context 'when creating new user' do
      subject { build :user, email: 'model@test.com', gender: nil }
      it { is_expected.to be_valid }
    end

    context 'when gender is set to nil' do
      subject { create :user, email: 'model@test.com', gender: nil }
      it { expect(subject.reload.gender).to eq('Not defined') }
    end
    context 'when gender is set to male' do
      subject { create :user, email: 'model@test.com', gender: 'Male' }
      it { expect(subject.reload.gender).to eq('Male') }
    end

    context 'when gender is not valid' do
      subject { build :user, email: 'model@test.com', gender: 'Potato' }
      it { is_expected.to_not be_valid }
    end

    context 'when user with that email is already exist' do
      let(:another_user) { create :user , email: 'test@test.com'}
      subject { build :user, another_user.attributes }

      it { is_expected.to_not be_valid }
    end

    context 'when trying to create empty user' do
      subject { build :user, email: '', password: '' }

      it { is_expected.to_not be_valid }
    end

    describe 'associations' do
      it { is_expected.to have_many :interests }
    end
  end
end
