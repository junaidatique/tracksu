class AddPlaceIdToActivity < ActiveRecord::Migration[5.0]
  def change
    add_reference :activities, :place, foreign_key: true
  end
end
