# -*- encoding : utf-8 -*-
class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
      t.integer :quantity
      t.string :color
      t.text :note
      t.references :order, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
