class ArchiveController < ApplicationController

def archive
end

def search2016
end

def search2017
end


def show2016

		if params[:sDateFrom].present? && params[:sDateFrom].to_i < 20160101 || params[:sDateThrough].to_i > 20161231
			flash[:danger] = "Date Range Must Be Between 20160101 and 20161231"	
			redirect_to search2016_path
		end

		if params[:sDateFrom].present?
			filenNameVar = params[:groupId] + "_" + params[:sDateFrom] + "-" + params[:sDateThrough] + "_details"
		else
			filenNameVar = params[:groupId] + "_details"
		end

		lNameResult = "%" + params[:lName] + "%"
		fNameResult = "%" + params[:fName] + "%"
		groupIdResult = "%" + params[:groupId] + "%"
		bDateResult = "%" + params[:bDate] + "%"
		sDateFromResult = "%" + params[:sDateFrom] + "%"
		sDateThroughResult = "%" + params[:sDateThrough] + "%"


		@order = Archive2016.order(:lName)
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
		@planSum = @claims.sum(:planPaid)
		@coSum = @claims.sum(:coPay)
		@totalSum = @claims.sum(:totalPaid)
		
	end

	def accum

	end

	def acresult2016

		if params[:sDateFrom].present? && params[:sDateFrom].to_i < 20160101 || params[:sDateThrough].to_i > 20161231
			flash[:danger] = "Date Range Must Be Between 20160101 and 20161231"	
			redirect_to search2016_path
		end

		if params[:sDateFrom].present?
			filenNameVar = params[:groupId] + "_" + params[:sDateFrom] + "-" + params[:sDateThrough] + "_Accumulator"
		else
			filenNameVar = params[:groupId] + "_Accumulator"
		end

		groupIdResult = "%" + params[:groupId] + "%"

		@order = Archive2016.order(:lName)
		@order = @order.order(:fName)
		@order = @order.order(:sDate)


		if params[:sDateFrom].present?
			@order = @order.where(sDate: params[:sDateFrom] .. params[:sDateThrough])
		end

		
		@accum = @order.where("groupId LIKE ?", groupIdResult).group(:lname, :fName, :bDate).select("lName, fName, bDate, groupId, SUM(planPaid) as planPaid, SUM(coPay) as coPay, SUM(totalPaid) as totalPaid")
		@export = @accum
			respond_to do |format|
				format.html
				format.csv { send_data @export.ac_to_csv, :filename => "#{filenNameVar}.csv" }
			end
		
	end

	def show2017

		if params[:sDateFrom].present? && params[:sDateFrom].to_i < 20170101 || params[:sDateThrough].to_i > 20171231
			flash[:danger] = "Date Range Must Be Between 20170101 and 20171231"	
			redirect_to search2017_path
		end

		if params[:sDateFrom].present?
			filenNameVar = params[:groupId] + "_" + params[:sDateFrom] + "-" + params[:sDateThrough] + "_details"
		else
			filenNameVar = params[:groupId] + "_details"
		end

		lNameResult = "%" + params[:lName] + "%"
		fNameResult = "%" + params[:fName] + "%"
		groupIdResult = "%" + params[:groupId] + "%"
		bDateResult = "%" + params[:bDate] + "%"
		sDateFromResult = "%" + params[:sDateFrom] + "%"
		sDateThroughResult = "%" + params[:sDateThrough] + "%"


		@order = Archive2017.order(:lName)
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
		@planSum = @claims.sum(:planPaid)
		@coSum = @claims.sum(:coPay)
		@totalSum = @claims.sum(:totalPaid)
	end

	def accum

	end

	def acresult2017

		if params[:sDateFrom].present? && params[:sDateFrom].to_i < 20170101 || params[:sDateThrough].to_i > 20171231
			flash[:danger] = "Date Range Must Be Between 20170101 and 20171231"	
			redirect_to search2017_path
		end

		if params[:sDateFrom].present?
			filenNameVar = params[:groupId] + "_" + params[:sDateFrom] + "-" + params[:sDateThrough] + "_Accumulator"
		else
			filenNameVar = params[:groupId] + "_Accumulator"
		end

		groupIdResult = "%" + params[:groupId] + "%"

		@order = Archive2017.order(:lName)
		@order = @order.order(:fName)
		@order = @order.order(:sDate)


		if params[:sDateFrom].present?
			@order = @order.where(sDate: params[:sDateFrom] .. params[:sDateThrough])
		end

		
		@accum = @order.where("groupId LIKE ?", groupIdResult).group(:lname, :fName, :bDate).select("lName, fName, bDate, groupId, SUM(planPaid) as planPaid, SUM(coPay) as coPay, SUM(totalPaid) as totalPaid")
		@export = @accum
			respond_to do |format|
				format.html
				format.csv { send_data @export.ac_to_csv, :filename => "#{filenNameVar}.csv" }
			end
		
	end

end
