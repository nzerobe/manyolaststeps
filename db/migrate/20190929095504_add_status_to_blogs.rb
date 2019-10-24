class AddStatusToBlogs < ActiveRecord::Migration[5.2]
  def change
#        add_column :blogs, :status, :integer, null: false, default: "0"
    add_column :blogs, :status, :string
  end
end
