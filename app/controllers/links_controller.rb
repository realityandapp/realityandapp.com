class LinksController < InheritedResources::Base
  before_filter :authenticate_admin_user!
  def create
    create!{new_link_path}
  end

  def update
    create!{links_path}
  end

  def permitted_params
    params.permit(link: [:name, :url, :is_follow])
  end
end
