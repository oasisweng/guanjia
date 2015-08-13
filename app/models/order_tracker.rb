# -*- encoding : utf-8 -*-
class OrderTracker < ActiveRecord::Base
  belongs_to :order
  default_scope -> { order(created_at: :desc) }
end
