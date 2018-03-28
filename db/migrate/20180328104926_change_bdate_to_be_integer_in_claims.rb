class ChangeBdateToBeIntegerInClaims < ActiveRecord::Migration[5.1]
  def change
  	change_column :claims, :bDate, :integer
  	change_column :claims, :sDate, :integer
  	add_column :claims, :bDate2, :string
  	add_column :claims, :sDate2, :string
  end
end
