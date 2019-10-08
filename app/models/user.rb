class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :blogs
  has_many :journals
  has_many :likes, dependent: :destroy
  has_many :liked_blog, through: :likes, source: :blog
  def already_liked?(blog)
    self.likes.exists?(blog_id: blog.id)
  end
  
  has_one_attached :image
  has_many :feed_contents, ->{ order("updated_at DESC") }
end
