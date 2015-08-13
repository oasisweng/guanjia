# -*- encoding : utf-8 -*-
class CreateCouponTypes < ActiveRecord::Migration
  def change
    create_table :coupon_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
