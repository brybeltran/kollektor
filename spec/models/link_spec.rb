require 'rails_helper'

RSpec.describe Link, type: :model do
  it { is_expected.to belong_to(:page).counter_cache(true) }

  it { is_expected.to validate_presence_of(:href) }

  it "increments the page links_count" do
    page = create(:page)
    expect { create_list(:link, 5, page: page) }.to change { page.reload.links_count }.by(5)
  end
end
