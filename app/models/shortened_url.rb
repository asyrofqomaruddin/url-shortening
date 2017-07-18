class ShortenedUrl < ApplicationRecord
  before_create :generate_short_url
  has_one :url_info

  def generate_short_url
  	self.shortened_link = loop do
      link = SecureRandom.urlsafe_base64(3)
      break link unless self.class.exists?(shortened_link: link)
    end unless shortened_link
  end

  def fixed_true_link
  	if !(true_link[0..3]=="http")
  	  result = "//"+true_link
  	else
  	  result = true_link
  	end
  	result
  end

  def clicked
  	begin
  	  info = UrlInfo.find_or_create_by(shortened_url_id: self.id)
  	  url_info.click_count = url_info.click_count+1
  	  url_info.save!
  	end
  end

end
