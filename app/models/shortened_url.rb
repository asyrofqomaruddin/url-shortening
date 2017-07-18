class ShortenedUrl < ApplicationRecord
  before_create :generate_short_url

  def generate_short_url
  	self.shortened_link = loop do
      link = SecureRandom.urlsafe_base64(3)
      break link unless self.class.exists?(shortened_link: link)
    end unless shortened_link
  end

end
