# -*- encoding : utf-8 -*-
class MembershipCard < ActiveRecord::Base
  belongs_to :user
  belongs_to :level

  validates :card_no, uniqueness:true, 
                      presence:true
end
