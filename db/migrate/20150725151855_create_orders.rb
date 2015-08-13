# -*- encoding : utf-8 -*-
class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :step
      t.text :message
      t.datetime :pickup_datetime
      t.datetime :delivery_datetime
      t.datetime :paid_at
      t.references :store, index: true, foreign_key: true
      t.references :user, index:true, foreign_key: true 

      t.timestamps null: false
    end
    
  end
end
