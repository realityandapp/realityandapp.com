class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Tree
  include Mongoid::Tree::Ordering

  field :name, type: String
  #field :path, type: String
  #field :ord, type: Integer, default: ->{ Category.count + 1}
  #belongs_to :parent, class_name: 'Category', inverse_of: :categories
  #has_many :categories, inverse_of: :parent
  #has_many :pages
  has_many :posts, class_name: 'Post', inverse_of: :category

  #belongs_to :path_page, class_name: 'Page', inverse_of: nil

  #accepts_nested_attributes_for :categories

  #scope :root, ->{where(parent: nil)}
  #default_scope ->{ asc [:depth, :position]  }

  validates :name, presence: true
  
  #index({ ord: 1 }, {background: true })

  def to_s
    #('-' * depth) + 
      name
  end
end
