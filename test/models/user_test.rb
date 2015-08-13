# -*- encoding : utf-8 -*-
require 'test_helper'
include UsersHelper
class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(full_name:  "Example User",
               phone_no: "13968120155",
               wechat_id: "oasis_weng",
               status: "Staff",
               store_id: 1,
               membership_card_attributes: {
                balance: 5000.0,
                level_id: 1,
                card_no: generate_card_no("Staff")})
  end

  test "should be valid" do
    assert @user.valid?
  end
end
