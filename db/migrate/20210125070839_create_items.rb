class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true, null: false
      t.string :item_name, null: false
      t.text :text, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :burden_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :ship_day_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
