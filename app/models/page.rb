class Page < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy

  enum :status, { pending: 0, processing: 1, done: 2, failed: 3 }

  validates :url,  presence: true
  validates :user, presence: true
end
