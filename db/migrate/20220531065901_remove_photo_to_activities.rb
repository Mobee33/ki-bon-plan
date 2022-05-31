class RemovePhotoToActivities < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :photo
  end
end
