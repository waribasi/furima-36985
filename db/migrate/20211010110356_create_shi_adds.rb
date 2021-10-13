class CreateShiAdds < ActiveRecord::Migration[6.0]
  def change
    create_table :shi_adds do |t|
      t.string :pos_code,              null: false
      t.integer :prefect_id,           null: false
      t.string :municipal,             null: false
      t.string :add,                   null: false
      t.string :build
      t.string :tel_num,               null: false
      t.references :pur,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
