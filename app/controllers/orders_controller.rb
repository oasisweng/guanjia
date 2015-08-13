class OrdersController < ApplicationController
  respond_to :html, :json

  def index
    @orders = Order.all.paginate(page: page)
    @orders_count = Order.count
    respond_with(@orders)
  end

  def new
  end

  def create

  end

  def edit
  end

  def update
  end

  def show
    respond_with(@order)
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:full_name,:phone_no,:wechat_id,:status,:store_id,:male,
                                 membership_card_attributes: [:balance, :level_id])
  end
 
end
