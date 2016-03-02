ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# en
  permit_params :name, :price, :quantity, :description, :category_id, :image
  menu if: proc{ current_admin_user.store.present? }

  filter :name
  filter :category
  filter :price
  filter :quantity
  filter :description

  controller do
    before_filter :store_owner_filter

    def store_owner_filter
      raise ActionController::RoutingError.new('Not Found') unless current_admin_user.store.present?
    end
  end

  index do
    selectable_column
    column "Name" do |product|
      link_to product.name, admin_product_path(product)
    end
    column :description
    column :price
    column :quantity
    column :category
  end

  form title: 'A custom title' do |f|

    inputs 'Details' do
      input :name
      input :category, :collection => Category.where(store: current_admin_user.store)
      input :description
      input :price
      input :quantity
      input :image
    end
    para "Press cancel to return to the list without saving."
    actions
  end

  scope_to :current_admin_user

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :quantity
      row :image
      row :store
    end
  end

end
