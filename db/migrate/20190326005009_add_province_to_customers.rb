class AddProvinceToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :province, foreign_key: true
  end
end
