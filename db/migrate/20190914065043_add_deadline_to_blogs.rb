class AddDeadlineToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :deadline, :Date
  end
end
