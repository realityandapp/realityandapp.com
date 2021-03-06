class MenusController < InheritedResources::Base
  before_filter :authenticate_admin_user!
  defaults :resource_class => Menu, :collection_name => 'menus', :instance_name => 'menu'

  def create
    create!{new_menu_path}
  end

  def update
    update!{menus_path}
  end

  def permitted_params
    params.permit(menu: [:parent, :name, :ord, :url, :page, :category, :post])
  end
end
