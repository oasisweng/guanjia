# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Item Type
ItemType.create!(name: "Clothing")
ItemType.create!(name: "Furniture")
ItemType.create!(name: "Shoes")
ItemType.create!(name: "Bags")

#Levels
Level.create!(discount: 1.0,
              name: "Number1")
Level.create!(discount: 0.7,
              name: "Number2")
Level.create!(discount: 0.6,
              name: "Number3")
Level.create!(discount: 0.5,
              name: "Number4")
Level.create!(discount: 0,
              name: "Number5")

#Stores
store = Store.create(address: "Caihongcheng 23-3-301",
                     latitude: "1.1111",
                     longitude: "2.2222",
                     factory: true,
                     name: "Caihongcheng",
                     manager_id: 1)
store = Store.create(address: "Daomaoxiang 25-96",
                     latitude: "2.1111",
                     longitude: "3.2222",
                     factory: true,
                     name: "Daomaoxiang",
                     manager_id: 2)

#Users
include UsersHelper

admin = User.create!(full_name:  "Prawn",
             phone_no: "13968120155",
             wechat_id: "oasis_weng",
             status: "Admin",
             store_id: 1,
             male: 1)

admin.create_membership_card!(balance: 625,
                              card_no: generate_card_no(admin.status),
                              level_id: 5)

40.times do |n|
  full_name  = Faker::Name.name
  phone_no = "135" + generate_number(8)
  wechat_id = generate_complex_code(10)
  u = User.create!(full_name:  full_name,
               phone_no: phone_no,
               wechat_id: wechat_id,
               status: "Client",
               store_id: 1,
               male: generate_random_number(1))
  u.create_membership_card!(balance: generate_number(4),
                              card_no: generate_card_no(u.status),
                              level_id: generate_random_number(4))
end

10.times do |n|
  full_name  = Faker::Name.name
  phone_no = "153" + generate_number(8)
  wechat_id = generate_complex_code(8)
  u = User.create!(full_name:  full_name,
               phone_no: phone_no,
               wechat_id: wechat_id,
               status: "Staff",
               store_id:2,
               male: generate_random_number(1))
  u.create_membership_card!(balance: generate_number(4),
                              card_no: generate_card_no(u.status),
                              level_id: generate_random_number(4))
end

1.times do |n|
  full_name  = Faker::Name.name
  phone_no = "138" + generate_number(8)
  wechat_id = generate_complex_code(8)
  u = User.create!(full_name:  full_name,
               phone_no: phone_no,
               wechat_id: wechat_id,
               status: "Manager",
               store_id:2,
               male: generate_random_number(1))
  u.create_membership_card!(balance: generate_number(4),
                              card_no: generate_card_no(u.status),
                              level_id: generate_random_number(4))
end
