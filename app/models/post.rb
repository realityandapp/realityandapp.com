class Post < Page
  field :introduction, type: String
  belongs_to :category, class_name: 'Category', inverse_of: :posts

  scope :newer_by, ->(post) {where(:created_at.gt => post.created_at).older}
  scope :older_by, ->(post) {where(:created_at.lt => post.created_at).recent}
  scope :absolute, ->{where(_type: 'Post')}

  def older
    @older ||= category.posts.older_by(self).first if category
  end

  def newer
    @newer ||= category.posts.newer_by(self).first if category
  end

  def self.to_s
    I18n.t('mongoid.models.post')
  end
end
