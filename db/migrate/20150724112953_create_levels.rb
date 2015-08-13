# -*- encoding : utf-8 -*-
class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.float :discount
      t.string :name

      t.timestamps null: false
    end
  end
end
