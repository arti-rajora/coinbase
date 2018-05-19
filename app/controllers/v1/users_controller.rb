class V1::UsersController < V1::BaseController

	def login
		user = User.find_by(:email => params[:username].downcase().strip())
		unless user
			render :json => {:responseCode => 500,:responseMessage => "Invalid email address."} 
		else
			user =  user.valid_password?(params[:password])
			unless user
				render :json => {:responseCode => 501,:responseMessage => "Invalid password."} 
			else
				render :json => {:responseCode => 200,:responseMessage => "You've signed in successfully.", :info => user}
			end
		end
		# unless user
		# 	render :json => {:responseCode => 500,:responseMessage => "error"} 
		# else
		# 	unless user.gauth_enabled?
		# 		user.valid_password?(params[:password])
  		#   	user.update_columns(token: SecureRandom.hex)
		#    	render :json => {:responseCode => 200,:responseMessage => "You've signed in successfully.", :info => user}
		# 	else
		# 		if (user.gauth_secret == params[:code])
		# 			user.valid_password?(params[:password])
		# 			user.update_columns(token: SecureRandom.hex)
		#    			render :json => {:responseCode => 200,:responseMessage => "You've signed in successfully.", :info => user}
		# 		else
		#    			render :json => {:responseCode => 200,:responseMessage => "Invalida auth code."}
		# 		end
		# 	end
		# end
	end

	def signup
		# binding.pry
		user = User.find_by(:email => params[:username].downcase().strip())
		unless user
			user = User.new(email: params[:username],
				password: params[:password],
				password_confirmation: params[:password_confirmation])
			user.save
		   	render :json => {:responseCode => 200,:responseMessage => "You've sign up successfully."}
		else
			render :json => {:responseCode => 500,:responseMessage => "Email already registered."}
		end


		# unless user
		# 	user = User.new(first_name: params[:user][:first_name],
		# 		last_name: params[:user][:last_name],
		# 		email: params[:user][:email],
		# 		mobile: params[:user][:mobile],
		# 		password: params[:user][:password],
		# 		password_confirmation: params[:user][:password_confirmation])
		# 	user.save
		#    	render :json => {:responseCode => 200,:responseMessage => "You've sign up successfully."}
		# else
		# 	render :json => {:responseCode => 500,:responseMessage => "Email already registered."}
		# end
	end

	def logout
		user = User.find_by(:token => params[:user][:token])
		unless user
			render_message 500, "Unauthorized user." 
		else
			user.update_columns(token: '')
			render :json => {:responseCode => 200,:responseMessage => "Logout successfully."}
		end
	end

	def forgot_password
		user = User.find_by(:email => params[:user][:email].downcase().strip())
		unless user
			render :json => {:responseCode => 500,:responseMessage => "Wrong Email."}
		else
			render :json => {:responseCode => 500,:responseMessage => "Token has been sent on Email."}
		end
	end

	def password_change
		user = User.find_by(:token => params[:user][:token])
		user.valid_password?(params[:user][:old_password]) if user.present?
		unless user
			render :json => {:responseCode => 500,:responseMessage => "Invalid Credentials."}
		else
			password = "#{SecureRandom.hex(3)}#{user.id}#{Time.now.to_i}"
			user.update_attributes(password: password,password_confirmation: password)
			render :json => {:responseCode => 200,:responseMessage => "Password changed successfully.", :info => user}
		end
	end

	def reset_password
		binding.pry
		user = User.find_by(:token => params[:user][:token])
		user.valid_password?(params[:user][:old_password]) if user.present?
		unless user
			render :json => {:responseCode => 500,:responseMessage => "Invalid Credentials."}
		else
			user.update_attributes(password: params[:user][:new_password],password_confirmation: params[:user][:new_password])
			render :json => {:responseCode => 200,:responseMessage => "Password reset successfully.", :info => user}
		end
	end

	def enable_2fa
		user = User.find_by(:token => params[:user][:token])
		unless user
			render_message 500, "Invalid Credentials." 
		else
			user.update_columns(gauth_enabled: true)
			render :json => {:responseCode => 200,:responseMessage => "2FA enabled successfully."}
		end
	end

	def disable_2fa
		user = User.find_by(:token => params[:user][:token],gauth_secret: params[:user][:code])
		unless user
			render :json => {:responseCode => 200,:responseMessage => "Invalid Credentials." }
		else
			user.update_columns(gauth_enabled: false)
			render :json => {:responseCode => 200,:responseMessage => "2FA disabled successfully."}
		end
	end


	def genrate_address
	end

end
