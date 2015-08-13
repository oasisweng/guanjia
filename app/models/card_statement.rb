# -*- encoding : utf-8 -*-
class CardStatement < ActiveRecord::Base
  belongs_to :user
  belongs_to :statement_type
  belongs_to :operator, class_name: "User"
end
