class CategoriesController < InheritedResources::Base
  defaults resource_class: Category, collection_name: 'categories', instance_name: 'category'
end
