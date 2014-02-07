class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  #field :path, type: String
  field :status, type: String
  field :published_at, type: Time
  field :visits, type: Integer, default: 0
  belongs_to :category

  scope :recent, ->{desc(:created_at)}
  scope :older, ->{asc(:created_at)}

  validates :content, presence: true
  def to_s
    title
  end
end
