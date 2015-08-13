# -*- encoding : utf-8 -*-
class ItemType < ActiveRecord::Base
  has_many :items
end
