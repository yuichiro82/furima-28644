class ItemsController < ApplicationController
  def index
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[item_params])
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(::name, :text, :category_id, :item_status_id, :burder_amount_id, :shipment_source_id, :delivery_schedule_id).merge(user_id: current_user.id)
  end
end
