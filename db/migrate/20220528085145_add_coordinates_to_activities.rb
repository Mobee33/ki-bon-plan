class AddCoordinatesToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :latitude, :float
    add_column :activities, :longtitude, :float
  end
end
