class Addcommenttoactivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :comment, :text
  end
end
