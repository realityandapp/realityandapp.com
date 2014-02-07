class PostsController < InheritedResources::Base
  before_filter :authenticate_admin_user!, except: [:index, :show]
  defaults :resource_class => Post, :collection_name => 'posts', :instance_name => 'post'

  def permitted_params
    params.permit(post: [:title, :content, :introduction, :category])
  end
end
