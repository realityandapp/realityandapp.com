class Category
  include Mongoid::Document
  field :name, type: String
  field :ord, type: Integer, default: ->{ Category.count + 1}
  field :is_menu, type: Boolean
  field :is_index, type: Boolean
  mount_uploader :image, FlashUploader
  belongs_to :parent, class_name: 'Category', inverse_of: :categories
  has_many :categories, inverse_of: :parent
  has_many :pages
  has_many :posts

  #accepts_nested_attributes_for :categories

  scope :root, where(parent: nil)
  scope :in_menu, where(is_menu: true)
  scope :in_index, where(is_index: true)
  default_scope desc(:ord)
  
  index({ ord: 1 }, {background: true })
  index({ is_menu: 1 }, {background: true })
  index({ is_index: 1 }, {background: true })

  def to_s
    name
  end
end
