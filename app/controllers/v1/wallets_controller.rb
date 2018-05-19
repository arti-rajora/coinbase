class V1::WalletsController < V1::BaseController

	def currency_list
	end

	def index
		wallet_list = %x[curl -X GET \ -H "Authorization: Bearer v2x019bd4d2d2b522f6afb367dce23611820d4915846239620e7247dcb6d8f415e2" \https://test.bitgo.com/api/v1/wallet]
		render :json => {:responseCode => 200,:responseMessage => "Wallet fetched successfully.",info: wallet_list}
	end

	#get wallet address
	def show


		wallet_id="5ac4a7e0f15e5a07a875be5be42a6161"
		token="v2x019bd4d2d2b522f6afb367dce23611820d4915846239620e7247dcb6d8f415e2"
		address="2N7f8JSDRvskeTcfF3btUiyLsjkyHtT3Vdb"
		aa="5ac4aad8d914aa07c10eb1b76add3d50"

		wallet = %x[curl -X POST \
		-H "Authorization: Bearer v2x019bd4d2d2b522f6afb367dce23611820d4915846239620e7247dcb6d8f415e2" \
		https://test.bitgo.com/api/v2/teth/enterprise/#{aa}/feeAddressBalance ]
		# %x[curl -X GET \ -H "Authorization: Bearer #{token}" \ https://test.bitgo.com/api/v2/#{params[:coin]}/wallet/#{wallet_id}/address/#{address}]
		# wallet = ActiveSupport::JSON.decode(wallet)

		render :json => {:responseCode => 200,:responseMessage => "Wallet info successfully.",info: wallet}
	end

	#genrate wallet address
	def create


		wallet_id="5ac4a7e0f15e5a07a875be5be42a6161"
		token="v2x019bd4d2d2b522f6afb367dce23611820d4915846239620e7247dcb6d8f415e2"

		wallet_add =  %x[curl -X POST \
		-H "Authorization: Bearer #{token}" \
		https://test.bitgo.com/api/v2/#{params[:coin]}/wallet/#{wallet_id}/address]


		wallet = ActiveSupport::JSON.decode(wallet_add)

		user = User.last

		user.wallets.create( address: wallet["address"], coin: wallet["coin"])

		render :json => {:responseCode => 200,:responseMessage => "Wallet created successfully."}


	end

	def genrate_wallet_address
	end
	



ENTERPRISEID="5ac4aad8d914aa07c10eb1b76add3d50"



end


curl -X POST \
-H "Authorization: Bearer v2x019bd4d2d2b522f6afb367dce23611820d4915846239620e7247dcb6d8f415e2" \
https://test.bitgo.com/api/v2/teth/enterprise/$ENTERPRISEID/feeAddressBalance 













