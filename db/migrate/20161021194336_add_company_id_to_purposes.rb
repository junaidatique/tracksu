class AddCompanyIdToPurposes < ActiveRecord::Migration[5.0]
  def change
    add_reference :purposes, :company, foreign_key: true
  end
end
