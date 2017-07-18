class UrlInfo < ApplicationRecord
  belongs_to :shortened_url

  def as_json(options={})
  	{
  	  click_count: click_count
  	}
  end
end
