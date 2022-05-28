class AddCategoryToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :category, :string
  end
end
