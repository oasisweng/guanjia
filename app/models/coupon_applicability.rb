# -*- encoding : utf-8 -*-
class CouponApplicability < ActiveRecord::Base
  belongs_to :coupon
  belongs_to :item
end
