# -*- encoding : utf-8 -*-
class Order < ActiveRecord::Base
  belongs_to :store
  belongs_to :user, counter_cache: true, inverse_of: :orders
  belongs_to :contact
  
  has_many :defects
  has_many :lineitems

  default_scope -> { order(created_at: :desc) }

  before_create :set_default_pickup_datetime

  def set_default_pickup_datetime
    self.pickup_datetime = Time.now
  end

end
