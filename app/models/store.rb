# -*- encoding : utf-8 -*-
class Store < ActiveRecord::Base
  has_many :orders
  has_many :clients, class_name: "User", foreign_key: "client_store_id"
  has_many :staffs, class_name: "User", foreign_key: "staff_store_id"

  belongs_to :manager, class_name: "User"


  validates :name, uniqueness:true
end
