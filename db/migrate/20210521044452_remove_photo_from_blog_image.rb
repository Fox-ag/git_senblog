class RemovePhotoFromBlogImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :blog_images, :photo, :string
  end
end
