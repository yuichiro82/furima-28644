class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :item_status_id, :burden_amount_id, :shipment_source_id, :delivery_schedule_id, :price).merge(user_id: current_user.id)
  end
end
