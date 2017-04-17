class Link < ApplicationRecord

  validates :url, presence: true

  def self.top_ten
    order(times_read: :desc).limit(10)
  end

end
