# -*- encoding : utf-8 -*-
class MembershipCardsController < ApplicationController
  respond_to :html, :json
  
  def prepare_topup
    @card = MembershipCard.find_by(user_id:params[:id])
    render 'topup'
  end

  def topup
    @card = MembershipCard.find(params[:id])
    if !params[:topup].empty? && params[:topup].to_f > 0.0
      @card.update(balance: @card.balance + params[:topup].to_f)
      #redirect_to users_path
    else
      flash.now[:warning] = "充值数不能为0"
    end
  end

  def prepare_pay
    @card = MembershipCard.find_by(user_id:params[:id])
    render 'pay'
  end

  def pay
    @card = MembershipCard.find(params[:id])
    if !params[:payment].empty? && params[:payment].to_f > 0.0
      if @card.balance < params[:payment].to_f
        flash.now[:warning] = "会员卡余额不足"
      else
        @card.update(balance: @card.balance - params[:payment].to_f)
        #redirect_to users_path
      end
    else
      flash.now[:warning] = "扣款数不能为0"
    end
  end
end
