class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  #field :status, type: String
  #field :published_at, type: Time
  field :visits, type: Integer, default: 0

  scope :recent, ->{desc(:created_at)}
  scope :older, ->{asc(:created_at)}
  #scope :absolute, ->{where(_type: nil)}

  validates :title, presence: true
  validates :content, presence: true
  def to_s
    title
  end

  def self.to_s
    I18n.t('mongoid.models.page')
  end
end
