# -*- encoding : utf-8 -*-
class Level < ActiveRecord::Base
	has_many :membership_cards
  has_many :users, through: :membership_cards

  validates :name, presence: true
end
