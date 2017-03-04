class CreateFeedbackIdentifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :feedback_identifiers do |t|
      t.string :token
      t.references :topic

      t.timestamps
    end
  end
end
