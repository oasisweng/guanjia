# -*- encoding : utf-8 -*-
class Order < ActiveRecord::Base
  belongs_to :store
  belongs_to :user, counter_cache: true, inverse_of: :orders
  has_many :defects
  has_many :lineitems

  default_scope -> { order(created_at: :desc) }


end
