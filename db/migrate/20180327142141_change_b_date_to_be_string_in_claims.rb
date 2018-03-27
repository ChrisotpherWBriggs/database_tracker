class ChangeBDateToBeStringInClaims < ActiveRecord::Migration[5.1]
  def change
    change_column :claims, :bDate, :string
    change_column :claims, :sDate, :string
  end
end
