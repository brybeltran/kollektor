class Link < ApplicationRecord
  belongs_to :page, counter_cache: true

  validates :href,  presence: true
  validates :page,  presence: true
end
