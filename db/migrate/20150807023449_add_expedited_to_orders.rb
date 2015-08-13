# -*- encoding : utf-8 -*-
class AddExpeditedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :expedited, :boolean, default: 0
  end
end
