class AddTaxesToProvinces < ActiveRecord::Migration[5.2]
  def change
    add_column :provinces, :gst, :decimal
    add_column :provinces, :pst, :decimal
    add_column :provinces, :hst, :decimal
  end
end
