class CreateArchive2016s < ActiveRecord::Migration[5.1]
  def change
    create_table :archive2016s do |t|
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
