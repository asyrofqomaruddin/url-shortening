class CreateUrlInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :url_infos do |t|
      t.integer :click_count,default: 0
      t.references :shortened_url
      t.timestamps
    end
    add_index :url_infos, :shortened_url_id, unique: true, name: "unique_index_url_infos_on_shortened_url_id"
  end
end
