class AddRatingToFood < ActiveRecord::Migration
  def change
    add_column :foods, :rating, :decimal
  end
end
