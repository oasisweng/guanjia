# -*- encoding : utf-8 -*-
class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.text :address
      t.float :latitude
      t.float :longitude
      t.boolean :factory
      t.string :name
      t.references :manager, index: true, foreign_key:true

      t.timestamps null: false
    end
  end
end
