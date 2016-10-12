class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.references :activity, foreign_key: true
      t.references :user, foreign_key: true
      t.text :comments

      t.timestamps
    end
  end
end
