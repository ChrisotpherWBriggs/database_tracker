class ChangeBdateToBeIntegerInWellmonts < ActiveRecord::Migration[5.1]
  def change
   	change_column :wellmonts, :bDate, :integer
  	change_column :wellmonts, :sDate, :integer
  	add_column :wellmonts, :bDate2, :string
  	add_column :wellmonts, :sDate2, :string
  end
end
