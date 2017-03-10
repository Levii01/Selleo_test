require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

  before { sign_in user }

  describe "GET #index" do
    subject { get :index }
    it_behaves_like 'template rendering action', :index
  end

  describe "DELETE #destroy" do
    context "when admin trying to destroy user" do
      let(:user) { create :user, admin: true }

      before { sign_in user }

      let!(:another_user) { create :user, admin: false }
      subject { delete :destroy, params: { id: another_user.id } }

      it { is_expected.to redirect_to users_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq("User #{another_user.email} was successfully destroyed.")
      end

      it 'destroys user' do
        expect{ subject }.to change(User, :count).by(-1)
      end
    end

    context "when user trying to destroy another user" do
      let(:user) { create :user, admin: false }

      before { sign_in user }

      let!(:another_user) { create :user, admin: false }
      subject { delete :destroy, params: { id: another_user.id } }

      it { is_expected.to redirect_to root_path }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to be_nil
      end

      it 'destroys user' do
        expect{ subject }.to_not change(User, :count)
      end
    end
  end
end
