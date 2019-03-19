ActiveAdmin.register Order do
  permit_params :orderDate, :orderTotal
end
