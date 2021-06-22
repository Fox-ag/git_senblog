class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum commenter: { normal: 0, commentban: 1}
  enum blogger: { general: 0, blogban: 1 }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :blogs, dependent: :destroy
  has_many :journals, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_blog, through: :likes, source: :blog
  has_many :comments, dependent: :destroy
  def already_liked?(blog)
    self.likes.exists?(blog_id: blog.id)
  end
  
  has_one_attached :image
  has_many :feed_contents, ->{ order("updated_at DESC") }
end
