class Menu
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :ord, type: Integer, default: ->{ Category.count + 1}
  field :url, type: String

  belongs_to :parent, class_name: 'Menu', inverse_of: :menus
  has_many :menus, inverse_of: :parent

  belongs_to :page, inverse_of: nil
  belongs_to :post, inverse_of: nil
  belongs_to :category, inverse_of: nil

  scope :root, ->{where(parent: nil)}
  default_scope ->{ asc [:ord, :created_at] }

  index({ ord: 1 }, {background: true })

  validates :name, presence: true, uniqueness: true
  validate :url_page_category_need_one

  def url_page_category_need_one
    errors.add(:url, :url_page_category_need_one) if url.blank? and page.blank? and category.blank? and post.blank?
  end

  def to_s
    name
  end
end
