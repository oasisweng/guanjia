# -*- encoding : utf-8 -*-
class CreateDefects < ActiveRecord::Migration
  def change
    create_table :defects do |t|
      t.string :picture
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
