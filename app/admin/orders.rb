ActiveAdmin.register Order do
  permit_params :orderDate, :orderTotal, :gst_amount, :pst_hst_amount, :stripe_charge_id
end
