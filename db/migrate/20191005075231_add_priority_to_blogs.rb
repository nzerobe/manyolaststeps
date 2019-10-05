class AddPriorityToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :priority, :integer, default: "0", null: false
  end
end
