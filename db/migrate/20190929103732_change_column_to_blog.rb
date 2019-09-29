class ChangeColumnToBlog < ActiveRecord::Migration[5.2]
  def change
    change_column :blogs, :title, :string, limit: 140
  end
end
