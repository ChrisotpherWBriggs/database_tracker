class ChangesToWellmonts < ActiveRecord::Migration[5.1]
  def change
  	change_column :wellmonts, :bDate, :date
  	change_column :wellmonts, :sDate, :date
  	rename_column :wellmonts, :bDate2, :birth_date
  	rename_column :wellmonts, :sDate2, :service_date
  end
end
