class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                 null: false
      t.text       :text,                 null: false
      t.integer    :category_id,          null: false
      t.integer    :item_status_id,       null: false
      t.integer    :burder_amount_id,     null: false
      t.integer    :shipment_source_id,   null: false
      t.integer    :delivery_schedule_id, null: false
      t.string     :price,                null: false
      t.timestamps
    end
  end
end
