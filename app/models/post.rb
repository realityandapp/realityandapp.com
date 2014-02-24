class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  #field :status, type: String
  #field :published_at, type: Time
  field :visits, type: Integer, default: 0
  field :introduction, type: String

  belongs_to :category, class_name: 'Category', inverse_of: :posts

  scope :recent, ->{desc(:created_at)}
  scope :older, ->{asc(:created_at)}
  scope :absolute, ->{where(_type: nil)}
  scope :newer_by, ->(post) {where(:created_at.gt => post.created_at).older}
  scope :older_by, ->(post) {where(:created_at.lt => post.created_at).recent}
  #scope :absolute, ->{where(_type: 'Post')}

  def older
    @older ||= category.posts.older_by(self).first if category
  end

  def newer
    @newer ||= category.posts.newer_by(self).first if category
  end

  def to_s
    title
  end

  def self.to_s
    I18n.t('mongoid.models.post')
  end
end
