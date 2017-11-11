ActiveAdmin.register Track do
  permit_params :currency_id, :token
  
  filter :wallets, collection: -> { Wallet.all.map { |w| [w.description, w.id] } }
  filter :currency
  filter :token
  filter :created_at
  filter :updated_at
  
  index do
    id_column
    column :token do |track|
      link_to track.token, "/#{track.token}"
    end
    column :currency
    column :created_at
    column :updated_at
    actions
  end
  
  show do
    attributes_table do
      row :token do |track|
        link_to track.token, "/#{track.token}"
      end
      row :currency
      row :created_at
      row :updated_at
      active_admin_comments
    end
  end
end
