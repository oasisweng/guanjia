# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  include UsersHelper

  respond_to :html, :json

  def index
    @users, @users_count = get_paginated_users_and_count(params[:status],params[:page])

    respond_with(@users)
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end

  def new
    @user = User.new
    @user.build_membership_card
  end

  def create
    @user = User.new(user_params)
    @user.membership_card.card_no = generate_card_no(@user.status)
    if @user.save
      #log_in @user
      flash.now[:notice] = "User was created successfully."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.suspended
      flash.now[:warning] = "User cannot be modified"
    elsif @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def toggle_suspension
    @user = User.find(params[:id])
    if !@user.suspended
      @user.update(suspended:true,suspension_reason:params[:suspension_reason])
    else
      @user.update(suspended:false,suspension_reason:"")
    end

    @users,@users_count = get_paginated_users_and_count(params[:status],params[:page])

    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name,:phone_no,:wechat_id,:status,:store_id,:male,
                                 membership_card_attributes: [:balance, :level_id])
  end

  def get_paginated_users_and_count(status,page)
    if status && status == "Staffs"
      @users_all = User.where("status == 'Admin' OR status == 'Manager' OR status == 'Staff'")
    else
      @users_all = User.where("status == 'Client'")
    end

    @users = @users_all.paginate(page: page)
    @users_count = @users_all.count

    return @users,@users_count
  end 

end
