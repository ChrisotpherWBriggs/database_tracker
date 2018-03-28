class Wellmont < ApplicationRecord
require 'csv'

	
	def self.to_csv(options = {})
    CSV.generate(options) do |csv|
    	columns = %w(lName fName birth_date groupId service_date drug planPaid coPay totalPaid)
      csv << columns
      all.each do |product|
        csv << product.attributes.values_at(*columns)
      end
    end
  end


def self.ac_to_csv(options = {})
    CSV.generate(options) do |csv|
    	columns = %w(lName fName birth_date groupId planPaid coPay totalPaid)
      csv << columns
      all.each do |product|
        csv << product.attributes.values_at(*columns)
      end
    end
  end

end