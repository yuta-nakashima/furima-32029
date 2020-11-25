class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,              null: false
      t.integer :price,             null: false
      t.text    :explanation,       null: false
      t.integer :category_id,       null: false
      t.integer :condition_id,      null: false
      t.integer :delivery_from_id,  null: false
      t.integer :delivery_fee_id,   null: false
      t.integer :delivery_date_id,  null: false
      t.references :user

      t.timestamps
    end
  end
end
