# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  belongs_to :item_type
  has_many :coupon_applicabilities
  has_many :applicable_coupons, through: :coupon_applicabilities,
                                source: :coupon
                                
  has_many :related_lineitems, class_name: "Lineitem"
end
