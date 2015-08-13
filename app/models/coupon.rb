# -*- encoding : utf-8 -*-
class Coupon < ActiveRecord::Base
  belongs_to :coupon_type
  has_many :user_coupons
  has_many :users, through: :user_coupons
  has_many :coupon_applicabilities
  has_many :restricted_items, through: :coupon_applicabilities, 
                              source: :item
end
