class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = Order.all
  end

  def show; end

  def new
    @order = Order.new
    @order.services.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
      render :new
    end
  end
  
  def edit; end

  def update
    if @order.update(order_params)
      redirect_to @order
    else
      render :edit
    end
  end

  def destroy
    @order.destroy

    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_name, :caterory_id, :executor_id, services_attributes: [:title, :category_id, :executor_id])
  end
end
