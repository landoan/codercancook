class AddSectionIdToFood < ActiveRecord::Migration
  def change
    add_column :foods, :section_id, :integer
  end
end
