# -*- encoding : utf-8 -*-
class CouponType < ActiveRecord::Base
  has_many :coupons
end
