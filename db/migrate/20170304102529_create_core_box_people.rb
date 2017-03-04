class CreateCoreBoxPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :core_box_people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_hash

      t.timestamps
    end
  end
end
