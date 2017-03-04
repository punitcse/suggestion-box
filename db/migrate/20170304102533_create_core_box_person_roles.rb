class CreateCoreBoxPersonRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :core_box_person_roles do |t|
      t.timestamps
    end
    add_reference :core_box_person_roles, :person, references: :core_box_people, index: true
    add_reference :core_box_person_roles, :role, references: :core_box_roles, index: true
  end
end
