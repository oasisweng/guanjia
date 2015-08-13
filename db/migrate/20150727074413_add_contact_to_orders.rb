# -*- encoding : utf-8 -*-
class AddContactToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :name, :string
    add_column :orders, :address, :text
    add_column :orders, :phone_no, :string
    add_column :orders, :male, :boolean
  end
end
