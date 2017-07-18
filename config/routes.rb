Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/:shortened_url", to: "shortened_url#redirect_url"
  get '',   to: 'shortened_url#new'
  post "/generate", to: "shortened_url#create"

  get '/info/:shortened_url', to: "shortened_url#url_info"
end
