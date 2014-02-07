class PagesController < InheritedResources::Base
  def permitted_params
    params.permit(page: [:title, :content])
  end
end
