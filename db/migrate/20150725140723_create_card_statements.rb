# -*- encoding : utf-8 -*-
class CreateCardStatements < ActiveRecord::Migration
  def change
    create_table :card_statements do |t|
      t.float :value
      t.text :note
      t.references :user, index: true, foreign_key: true
      t.references :statement_type, index: true, foreign_key: true
      t.references :operator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
