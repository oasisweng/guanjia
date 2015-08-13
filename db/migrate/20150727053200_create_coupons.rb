# -*- encoding : utf-8 -*-
class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.references :coupon_type, index: true, foreign_key: true
      t.integer :value
      t.text :note
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps null: false
    end
  end
end
