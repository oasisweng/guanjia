# -*- encoding : utf-8 -*-
class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :phone_no
      t.text :address
      t.boolean :male
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
