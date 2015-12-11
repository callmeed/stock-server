class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.string  :image_data_id
      t.string  :image_data_filename
      t.integer :image_data_size
      t.string  :image_data_content_type
      t.integer :license_id, index: true
      t.text :metadata

      t.timestamps null: false
    end
  end
end
