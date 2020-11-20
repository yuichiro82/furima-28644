class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destory]
  before_action :set_item, only: [:show, :edit, :update, :destory]

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
  end

  def edit
    if current_user.id == @item.user_id
      render :edit
    else 
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destory
    if current_user.id == @item.user_id
      render :destory
    else 
      redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :item_status_id, :burden_amount_id, :shipment_source_id, :delivery_schedule_id, :price).merge(user_id: current_user.id)
  end
end
