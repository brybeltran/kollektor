require "httparty"

class ScrapePageJob < ApplicationJob
  queue_as :default
  retry_on HTTParty::Error, Net::OpenTimeout, attempts: 3, wait: 30.seconds

  def perform(page_id)
    page = Page.find(page_id)
    page.processing!

    response = HTTParty.get(
      page.url,
      headers: { "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36" },
      follow_redirects: true,
      timeout: 15
    )

    raise "Bad HTTP status: #{response.code}" unless response.success?

    doc = Nokogiri::HTML5(response.body)

    ActiveRecord::Base.transaction do
      page.update!(
        title: doc.at_css("title")&.text&.truncate(150),
        status: :done
      )

      doc.css("a[href]").each do |a|
        page.links.create!(
          href: a["href"],
          label: a.inner_html.truncate(150)
        )
      end
    end

  rescue StandardError => e
    page.failed!
    Rails.logger.error "[ScrapePageJob] #{e.class}: #{e.message}"
  end
end
