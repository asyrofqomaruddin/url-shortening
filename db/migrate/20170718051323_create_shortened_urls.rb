class CreateShortenedUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :shortened_urls do |t|
      t.text :true_link
      t.string :shortened_link

      t.timestamps
    end
    add_index :shortened_urls, :shortened_link, name: "index_shortenedurls_on_shortenedlink"
  end
end
