class CreateCoreBoxPersonProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :core_box_person_projects do |t|
      t.timestamps
    end
    add_reference :core_box_person_projects, :person, references: :core_box_people, index: true
    add_reference :core_box_person_projects, :project, references: :core_box_projects, index: true
  end
end
