# -*- encoding : utf-8 -*-
class CreateCouponApplicabilities < ActiveRecord::Migration
  def change
    create_table :coupon_applicabilities do |t|
      t.references :coupon, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
