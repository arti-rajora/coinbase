class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

	def find_user
		# render_message 500, "Need userId in header." and return if request.headers["HTTP_USER_ID"].nil?
		@user = User.find_by(:id => request.headers["HTTP_USER_ID"])
		unless @user
		  render_message 500, "User doesn't exist with this Id." 
		end
	end
  
end
