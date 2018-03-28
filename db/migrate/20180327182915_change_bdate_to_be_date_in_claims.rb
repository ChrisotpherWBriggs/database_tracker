class ChangeBdateToBeDateInClaims < ActiveRecord::Migration[5.1]

  def change
  	change_column :claims, :bDate, :date
  	change_column :claims, :sDate, :date
  end
end
