ActiveAdmin.register Post do
  permit_params :titulo, :sigla_ramo, :precio, :descripcion, :user_id
  
end
