class AddCustStripeIdToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :stripe_cust_id, :string
  end
end
