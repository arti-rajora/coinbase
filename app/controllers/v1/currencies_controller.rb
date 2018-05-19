class V1::CurrenciesController < ApplicationController

	def index

		# list = Book.all
		currency_list = Currency.all
		# currency =  %x[curl -H "Content-Type: application/json" -X GET https://www.cryptopia.co.nz/api/GetCurrencies]	
		# currency_list = ActiveSupport::JSON.decode(currency)
		# list = currency_list["Data"].map{|x| [x["Id"], x["Name"], x["Symbol"] ]}
		render :json => {:responseCode => 200,:responseMessage => "Currency list fetched successfully.",currencies: currency_list}
	end

	def show
	end

	def new
	end

	def edit
	end
	
end
