class WellmontController < ApplicationController
	def wellmont
	
	end

	def wellshow

		if params[:sDateFrom].present?
			filenNameVar = "301" + "_" + params[:sDateFrom] + "-" + params[:sDateThrough] + "_details"
		else
			filenNameVar = "301" + "_details"
		end

		lNameResult = "%" + params[:lName] + "%"
		fNameResult = "%" + params[:fName] + "%"
		groupIdResult = "%" + "301" + "%"
		bDateResult = "%" + params[:bDate] + "%"
		sDateFromResult = "%" + params[:sDateFrom] + "%"
		sDateThroughResult = "%" + params[:sDateThrough] + "%"


		@order = Wellmont.order(:lName)
		@order = @order.order(:fName)
		@order = @order.order(:sDate)

		if params[:sDateFrom].present?
			@order = @order.where(sDate: params[:sDateFrom] .. params[:sDateThrough])
		end
		
		
		@claims = @order.where("lName LIKE ? AND fName LIKE ? AND groupId LIKE ? AND bDate LIKE ?", lNameResult, fNameResult, groupIdResult, bDateResult)
			respond_to do |format|
				format.html
				format.csv { send_data @claims.to_csv, :filename => "#{filenNameVar}.csv" }
			end
		@claims = @claims.paginate(:page => params[:page], :per_page => 200)
		@planSum = @claims.sum(:planPaid)
		@coSum = @claims.sum(:coPay)
		@totalSum = @claims.sum(:totalPaid)
	end

	def wellacresult

		if params[:sDateFrom].present?
			filenNameVar = "301" + "_" + params[:sDateFrom] + "-" + params[:sDateThrough] + "_Accumulator"
		else
			filenNameVar = "301" + "_Accumulator"
		end

		groupIdResult = "%" + "301" + "%"

		@order = Wellmont.order(:lName)
		@order = @order.order(:fName)
		@order = @order.order(:sDate)


		if params[:sDateFrom].present?
			@order = @order.where(sDate: params[:sDateFrom] .. params[:sDateThrough])
		end

		
		@accum = @order.where("groupId LIKE ?", groupIdResult).group(:lname, :fName, :bDate).select("lName, fName, birth_date, groupId, SUM(planPaid) as planPaid, SUM(coPay) as coPay, SUM(totalPaid) as totalPaid")
		@export = @accum
			respond_to do |format|
				format.html
				format.csv { send_data @export.ac_to_csv, :filename => "#{filenNameVar}.csv" }
			end
		
	end
end
