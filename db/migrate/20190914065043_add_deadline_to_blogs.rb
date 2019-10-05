class AddDeadlineToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :deadline, :date, null: false, default: "2999-12-31"
    
  end
end
