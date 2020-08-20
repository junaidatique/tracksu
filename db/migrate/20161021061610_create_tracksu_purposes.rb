class CreateTracksuPurposes < ActiveRecord::Migration[5.0]
  def change
    create_table :purposes do |t|
      t.string :title
      t.boolean :activated

      t.timestamps
    end
  end
end
