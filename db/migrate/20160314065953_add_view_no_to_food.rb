class AddViewNoToFood < ActiveRecord::Migration
  def change
    add_column :foods, :view_no, :integer
  end
end
