class RemoveEmailAndPasswordFromCustomer < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :email, :string
    remove_column :customers, :password, :string
  end
end
