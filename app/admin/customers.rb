ActiveAdmin.register Customer do
  permit_params :name, :phone, :email, :username, :password, :address
end
