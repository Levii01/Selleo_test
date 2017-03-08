require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#which_alert" do
    let(:success) { 'notice'}
    let(:danger) { 'danger'}

    it 'returns success alert' do
      expect(helper.select_class_alert(success)).to eq('success')
    end

    it 'return danger alert' do
      expect(helper.select_class_alert(danger)).to eq('danger')
    end
  end
end
