# -*- encoding : utf-8 -*-
class CreateMembershipCards < ActiveRecord::Migration
  def change
    create_table :membership_cards do |t|
      t.float :balance, default: 0
      t.string :card_no
      t.references :user, index: true, foreign_key: true
      t.references :level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
