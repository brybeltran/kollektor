require "rails_helper"

RSpec.describe ScrapePageJob, type: :job do
  include ActiveJob::TestHelper

  let(:user) { create(:user) }
  let(:page) { create(:page, user: user, url: "https://example.com") }

  it "scrapes links and updates counters" do
    perform_enqueued_jobs { described_class.perform_now(page.id) }

    page.reload
    expect(page).to be_done
    expect(page.links_count).to eq 1
    expect(page.links.pluck(:href)).to match_array([ "https://www.iana.org/domains/example" ])
  end
end
