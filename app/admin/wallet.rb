ActiveAdmin.register Wallet do
  permit_params :address, :description, :task_id, :last_changed, :last_total
end
