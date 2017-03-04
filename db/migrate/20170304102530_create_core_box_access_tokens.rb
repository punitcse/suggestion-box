class CreateCoreBoxAccessTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :core_box_access_tokens do |t|
      t.string :token

      t.timestamps
    end
    add_reference :core_box_access_tokens, :person, references: :core_box_people, index: true
  end
end
