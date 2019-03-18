class AddOrderToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :order, foreign_key: true
  end
end
