# -*- encoding : utf-8 -*-
class Contact < ActiveRecord::Base
  belongs_to :user

  validates :full_name, presence: true, 
                    length: {maximum: 50}
  validates :address, presence: true
  validates :male, presence: true
  VALID_PHONE_NO_REGEX = /\A1[358]\d{9}\Z/i
  validates :phone_no, presence: true, 
                    length: {maximum: 11},
                    format: { with: VALID_PHONE_NO_REGEX }
  
end
