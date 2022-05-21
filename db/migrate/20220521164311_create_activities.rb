class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.text :details
      t.boolean :is_available
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
