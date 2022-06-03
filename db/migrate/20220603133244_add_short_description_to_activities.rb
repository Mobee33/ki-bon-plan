class AddShortDescriptionToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :short_description, :string
  end
end
