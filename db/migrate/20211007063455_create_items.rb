class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item,           null: false
      t.text :exp,              null: false
      t.integer :cate_id,       null: false
      t.integer :status_id,     null: false
      t.integer :del_fee_id,    null: false
      t.integer :area_id,       null: false
      t.integer :del_day_id,    null: false
      t.integer :price,         null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end

 #item変更しとほうがいい？
