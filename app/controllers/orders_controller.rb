class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
  end

  def show
  end

  def checkout
    @province = Province.find(current_customer.province_id)
    # placeholders probably calculate taxes here
    # after you've added them in your table
    @gst = session[:subtotal] * @province.gst
    @pst_hst = session[:subtotal] * (@province.pst + @province.hst)

    session[:total] = session[:subtotal] + (@gst + @pst_hst)
  end

  def save_order
    # change orderTotal to actual total calculated with taxes
    @new_order = Order.new(
      customer_id: current_customer.id,
      orderDate: DateTime.now,
      orderTotal: session[:total]
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
