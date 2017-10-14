class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :token

      t.timestamps
    end
    add_index :tracks, :token, unique: true
  end
end
