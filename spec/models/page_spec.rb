require 'rails_helper'

RSpec.describe Page, type: :model do
  subject { build(:page) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:links).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:url) }

  it "belongs to the current user when created" do
    page = create(:page)
    expect(page.user).to be_present
  end

  it "defaults to pending" do
    page = Page.new
    expect(page.status).to eq("pending")
  end
end
