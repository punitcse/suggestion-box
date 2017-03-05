class RemovePersonFromAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :core_box_person_id
  end
end
