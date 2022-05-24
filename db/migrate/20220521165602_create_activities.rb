class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.text :details
      t.boolean :is_available, default: true
      t.integer :price
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
