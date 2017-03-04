class AddPersonReferrenceToTopic < ActiveRecord::Migration[5.0]
  def change
    add_reference :topics, :person, references: :core_box_people, index: true
  end
end
