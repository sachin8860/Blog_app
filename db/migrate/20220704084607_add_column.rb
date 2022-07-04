class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_reference :blog_tags, :blog, foreing_key: true
    add_reference :blog_tags, :tag, foreing_key: true
  end
end
