# -*- encoding : utf-8 -*-
class CreateOrderTrackers < ActiveRecord::Migration
  def change
    create_table :order_trackers do |t|
      t.integer :step
      t.text :message
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
    #order tracker info always appears in desc order
    add_index :order_trackers, [:order_id,:created_at]
  end


end
