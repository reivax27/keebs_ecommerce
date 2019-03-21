class RemoveReferenceFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :customers, :order, foreign_key: true
  end
end
