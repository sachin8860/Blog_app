class ChangeBodyToBeTextInBlogs < ActiveRecord::Migration[6.1]
  def change
    change_column :blogs, :body, :text
  end
end
