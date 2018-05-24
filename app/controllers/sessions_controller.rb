class SessionsController < ApplicationController


	def create
		binding.pry
		auth = request.env["omniauth.auth"]
		session[:omniauth] = auth
		user = User.sign_in_from_omniauth(auth)
    	session[:user_id] = user.id
    	render :json => {:responseCode => 200,:responseMessage => "You've signed in successfully.", :info => user}
    end


	
	def destroy
	    session[:user_id] = nil
	    session[:omniauth] = nil
	    redirect_to root_url
  	end


end
