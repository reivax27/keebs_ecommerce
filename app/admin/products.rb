ActiveAdmin.register Product do
  permit_params :name, :description, :price, :unitStock, :image
end
