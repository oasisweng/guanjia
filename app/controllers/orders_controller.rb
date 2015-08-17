class OrdersController < ApplicationController
  respond_to :html, :json

  def index
    @orders = Order.all.paginate(page: params[:page])
    @orders_count = Order.count
    respond_with(@orders)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
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

  def order_params
    params.require(:order).permit(:message, :expedited, :pickup_datetime, :user_id, :store_id, :contact_id)
  end
 
end
