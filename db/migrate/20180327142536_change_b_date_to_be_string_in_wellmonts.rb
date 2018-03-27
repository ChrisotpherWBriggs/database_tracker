class ChangeBDateToBeStringInWellmonts < ActiveRecord::Migration[5.1]
  def change
    change_column :wellmonts, :bDate, :string
    change_column :wellmonts, :sDate, :string
  end
end
