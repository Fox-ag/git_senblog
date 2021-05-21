class AddImageToBlogImage < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_images, :image, :string
  end
end
