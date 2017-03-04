class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :rating_scale
      t.datetime :expiry_date

      t.timestamps
    end
  end
end
