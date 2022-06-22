class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :item_id, null: false
      t.string  :item_name, null: false
      t.text    :description, null: false
      t.string  :image_url, null: false
      t.float   :star, null: false
      t.timestamps
    end
  end
end
