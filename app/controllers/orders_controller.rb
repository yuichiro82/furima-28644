class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @order = OrderAddress.new(order_params)
    @order.save
  end

  private

  def order_params
    parmit.require(:order_address).parmit(:postal_code,:prefecture_id, :city, :house_number, :building_name, :phone_nubmer)
end
