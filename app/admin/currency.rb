ActiveAdmin.register Currency do
  permit_params :name, :unit, :precision
end
