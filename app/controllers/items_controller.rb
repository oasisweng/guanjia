class ItemsController < ApplicationController
  respond_to :html, :json

  def index
    @itesm = Item.all.paginate(page: params[:page])
    @items_count = Item.count
    respond_with(@items)
  end

  private 

  def item_params
    params.require(:item).permit(:name, :price, :unit, :picture, :item_type_id)
  
  end
end
