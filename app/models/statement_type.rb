# -*- encoding : utf-8 -*-
class StatementType < ActiveRecord::Base
  has_many :card_statements
end
