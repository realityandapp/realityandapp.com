class Menu
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :ord, type: Integer
  field :path, type: String

  belongs_to :parent, class_name: 'Menu', inverse_of: :menus
  has_many :menus, inverse_of: :parent

  belongs_to :page, inverse_of: nil
  belongs_to :category, inverse_of: nil

  scope :root, ->{where(parent: nil)}
  default_scope ->{ asc :ord  }

  index({ ord: 1 }, {background: true })

  def to_s
    name
  end
end
