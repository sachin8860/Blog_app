class DropTableBlogTag < ActiveRecord::Migration[6.1]
  def change
    drop_table :blog_tags
  end
end
