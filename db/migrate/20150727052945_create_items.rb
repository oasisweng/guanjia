# -*- encoding : utf-8 -*-
class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :unit
      t.string :picture
      t.references :item_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
