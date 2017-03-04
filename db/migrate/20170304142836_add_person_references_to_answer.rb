class AddPersonReferencesToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :core_box_person, refernces: :core_box_people, foreign_key: true
  end
end
