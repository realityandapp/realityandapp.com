class PagesController < InheritedResources::Base
  before_filter :authenticate_admin_user!, except: [:index, :show]
  caches_page   :show

  def permitted_params
    params.permit(page: [:title, :content])
  end
end
