class AddUniqueToShortened < ActiveRecord::Migration[5.0]
  def change
  	add_index :shortened_urls, :shortened_link, unique: true
  end
end
