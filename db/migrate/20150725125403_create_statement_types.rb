# -*- encoding : utf-8 -*-
class CreateStatementTypes < ActiveRecord::Migration
  def change
    create_table :statement_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
