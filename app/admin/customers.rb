ActiveAdmin.register Customer do
  permit_params :name, :phone, :email, :username, :encrypted_password, :address, :province_id
end
