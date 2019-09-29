class ChangeBlogsColumnNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :blogs, :title, false
    change_column_null :blogs, :content, false
  end
end
