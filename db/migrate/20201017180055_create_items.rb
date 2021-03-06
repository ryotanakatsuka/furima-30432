class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,                 null: false
      t.text        :text,                 null: false
      t.integer     :condition_id,         null: false
      t.integer     :shipping_charges_id,  null: false
      t.integer     :delivery_source_id,   null: false
      t.integer     :delivery_date_id,     null: false
      t.integer     :price,                null: false
      t.references  :user,                 foreign_key: true
      t.integer    :genre_id,              null: false
      
      t.timestamps
    end
  end
end