class AddPhotoToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :photo, :string
  end
end
