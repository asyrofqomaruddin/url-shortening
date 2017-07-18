class ShortenedUrlController < ApplicationController
	def new
	end

	def create
  	  url = params[:url]
  	  shortened_url_object = ShortenedUrl.create(true_link: url)
  	  shortened_url = shortened_url_object.shortened_link
  	  render json: {shortened_url: shortened_url}
  	end

  	def redirect_url
  	  shortened_url_object = ShortenedUrl.find_by(shortened_link: params[:shortened_url])
  	  Thread.new do
  	  	shortened_url_object.clicked
  	  end
  	  true_link = shortened_url_object.fixed_true_link
  	  redirect_to true_link
 	end

 	def url_info
 	  shortened_url_object = ShortenedUrl.find_by!(shortened_link: params[:shortened_url])
 	  render json: shortened_url_object.as_json
 	end
end
