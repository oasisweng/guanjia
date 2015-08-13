# -*- encoding : utf-8 -*-
class Defect < ActiveRecord::Base
  belongs_to :order
  mount_uploader :picture, PictureUploader
end
