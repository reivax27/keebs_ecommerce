class AddTaxAmountsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :gst_amount, :decimal
    add_column :orders, :pst_hst_amount, :decimal
  end
end
