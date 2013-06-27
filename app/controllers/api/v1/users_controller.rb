module Api
	module V1
		class UsersController < ActionController::Base
			prepend_before_filter :get_auth_token
			before_filter :authenticate_user!, except: [:index, :show]
			respond_to :json

			def show
				@user = User.find_by_authentication_token(params[:auth_token])
		  		render json: @user
		  	end

			protected
			def get_auth_token
	  			params[:auth_token] = request.headers["Auth_token"]
		  	end

		end
	end
end
