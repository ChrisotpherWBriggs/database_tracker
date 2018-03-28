class ChangeClaimDateFormats < ActiveRecord::Migration[5.1]
  def change
  	change_column :claims, :bDate, :date
  	change_column :claims, :sDate, :date
  	rename_column :claims, :bDate2, :birth_date
  	rename_column :claims, :sDate2, :service_date
  end
end
