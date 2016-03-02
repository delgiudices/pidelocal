ActiveAdmin.register Category do

  permit_params :name, :identifier
  scope_to :current_admin_user
  menu if: proc{ current_admin_user.store.present? }

  filter :name
  filter :identifier

  index do
    selectable_column
    column "Name" do |category|
      link_to category.name, admin_category_path(category)
    end
    column :identifier
  end

  form title: 'Create category' do |f|
    inputs 'Details' do
      input :name
      input :identifier
    end
    para "Press cancel to return to the list without saving."
    actions
  end

  controller do
    before_filter :store_owner_filter

    def store_owner_filter
      raise ActionController::RoutingError.new('Not Found') unless current_admin_user.store.present?
    end
  end

end
