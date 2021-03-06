class HomeController < ApplicationController

before_action :require_user

require 'csv'
	

	def index

		
	end

	def show

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


		@order = Claim.order(:lName)
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

	def acresult

		
		if params[:sDateFrom].present?
			filenNameVar = params[:groupId] + "_" + params[:sDateFrom] + "-" + params[:sDateThrough] + "_Accumulator"
		else
			filenNameVar = params[:groupId] + "_Accumulator"
		end

		groupIdResult = "%" + params[:groupId] + "%"

		@order = Claim.order(:lName)
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

	def edit
		idresult = "%" + params[:id] + "%"



		@claims = Claim.where("id LIKE ?", idresult)
	end

	def deletenull
		@claims = Claim.where("groupId IS null")
		@claims.delete_all
	end

	def update
		idresult = "%" + params[:id] + "%"
		@claims = Claim.where("id LIKE ?", idresult)
		@claims.update(lName: params[:lName], fName: params[:fName], bDate: params[:bDate], groupId: params[:groupId], sDate: params[:sDate], drug: params[:drug], planPaid: params[:planPaid], coPay: params[:coPay], totalPaid: params[:totalPaid])

	end

	def new
		lNameResult = "%" + params[:lName] + "%"
		fNameResult = "%" + params[:fName] + "%"
		groupIdResult = "%" + params[:groupId] + "%"
		bDateResult = "%" + params[:bDate] + "%"	

		object = Claim.create(:lName => params[:lName], :fName => params[:fName], :bDate => params[:bDate], :groupId => params[:groupId], :sDate => params[:sDate], :drug => params[:drug], :planPaid => params[:planPaid], :coPay => params[:coPay], :totalPaid => params[:totalPaid])
		object.save
		@claims = Claim.where("lName LIKE ? AND fName LIKE ? AND groupId LIKE ? AND bDate LIKE ?", lNameResult, fNameResult, groupIdResult, bDateResult)

	end

	def delete
		idresult = "%" + params[:id] + "%"

		@claims = Claim.where("id LIKE ?", idresult)
		@claims.delete_all
	end
end

