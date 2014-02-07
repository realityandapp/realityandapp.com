class PostsController < InheritedResources::Base
  defaults :resource_class => Post, :collection_name => 'posts', :instance_name => 'post'

  def permitted_params
    params.permit(post: [:title, :content, :introduction])
  end
end
