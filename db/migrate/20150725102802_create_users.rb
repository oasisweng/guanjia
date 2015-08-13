# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone_no
      t.string :full_name
      t.string :wechat_id
      t.boolean :male, default: true
      #status 0: client
      #status 1: staff
      #status 2: manager
      #status 3: admin
      t.string :status, null:false, default: "Client"
      t.references :store, index: true, foreign_key:true
      t.string :verification_code
      t.datetime :verification_datetime
      t.boolean :suspended, default: false
      t.text :suspension_reason, default: ""

      t.timestamps null: false
    end
  end
end
