class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    # it works, but i'm not sure why customer is actually customer_id. nani??
    # @orders = Order.where(customer: current_customer.id)
    @orders = current_customer.orders
  end

  def show
    # @order = Order.find(params[:id])
  end

  def checkout
    @province = Province.find(current_customer.province_id)
    # placeholders probably calculate taxes here
    # after you've added them in your table
    session[:gst_amount] = session[:subtotal] * @province.gst
    session[:pst_hst_amount] = session[:subtotal] * (@province.pst + @province.hst)
    session[:total] = session[:subtotal] + (session[:gst_amount] + session[:pst_hst_amount])
  end

  def save_order
    @new_order = Order.new(
      customer_id: current_customer.id,
      orderDate: DateTime.now,
      orderTotal: session[:total],
      gst_amount: session[:gst_amount],
      pst_hst_amount: session[:pst_hst_amount]
    )

    session[:shopping_cart].each do |product|
      order_detail = @new_order.order_details.new(
        product_id: Product.find(product['id']).id.to_i,
        quantity: product['quantity'].to_i,
        priceOnOrder: Product.find(product['id']).price.to_d
      )
    end
    @new_order.save!
    session[:shopping_cart] = []
  end
end
