class Post < Page
  field :introduction, type: String
  mount_uploader :image, ImageUploader

  validates :title, presence: true

  scope :newer_by, lambda{|post| where(:created_at.gt => post.created_at).older}
  scope :older_by, lambda{|post| where(:created_at.lt => post.created_at).recent}

  def older
    @older ||= category.posts.older_by(self).first if category
  end

  def newer
    @newer ||= category.posts.newer_by(self).first if category
  end
end
