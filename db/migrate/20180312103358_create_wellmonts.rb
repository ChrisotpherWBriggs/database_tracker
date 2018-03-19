class CreateWellmonts < ActiveRecord::Migration[5.1]
  def change
    create_table :wellmonts do |t|
    	t.string :lName
    	t.string :fName
    	t.integer :bDate
    	t.integer :groupId
    	t.integer :sDate
    	t.string :drug
    	t.decimal :planPaid
    	t.decimal :coPay
    	t.decimal :totalPaid

        t.timestamps
    end
  end
end
