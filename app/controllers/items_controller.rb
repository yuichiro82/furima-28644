class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :item_status_id, :burden_amount_id, :shipment_source_id, :delivery_schedule_id, :price).merge(user_id: current_user.id)
  end
end
