class CreateBlogTags < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_tags do |t|
      t.references :blog
      t.references :tag

      t.timestamps
    end
  end
end
