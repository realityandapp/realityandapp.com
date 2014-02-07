class CategoriesController < InheritedResources::Base
  before_filter :authenticate_admin_user!, except: [:index, :show]
  #defaults resource_class: Category, collection_name: 'categories', instance_name: 'category'
  #
  def create
    create!{new_category_path}
  end

  def permitted_params
    params.permit(category: [:name, :parent, :position, :depth])
  end
end
