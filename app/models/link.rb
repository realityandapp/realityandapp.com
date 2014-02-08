class Link
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :url, type: String
  field :is_follow, type: Mongoid::Boolean, default: false
  field :ord, type: Integer, default: ->{ Category.count + 1}

  default_scope ->{ asc :ord  }

  index({ ord: 1 }, {background: true })

  validates :name, presence: true
  validates :url, presence: true

  def to_s
    name
  end
end
