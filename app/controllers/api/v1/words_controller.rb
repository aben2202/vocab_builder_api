module Api
	module V1
		class WordsController < ActionController::Base
			prepend_before_filter :get_auth_token
			before_filter :authenticate_user!, except: [:index, :show]
			respond_to :json

			# POST /words
			# Required params - word
		  	def create
		  		debugger
		  		@user = User.find_by_authentication_token(params[:auth_token])
		  		@theNewWord = Word.new
		  		@theNewWord.the_word = params[:word][:the_word]
		  		@theNewWord.review_cycle_start = DateTime.now
		  		@theNewWord.user_id = @user.id
		  		@theNewWord.save
		  		render json: @theNewWord
		  	end

		  	# PUT /words/1
		  	# Required params - word
			def update
				@word = Word.update(params[:word][:id], params[:word])
				render json: @word
			end

			#DELETE /words/1
		  	#Required params - word
		  	def destroy
		  		respond_with Gym.destroy(params[:id])
		  	end


		  	protected
			def get_auth_token
	  			params[:auth_token] = request.headers["Auth_token"]
		  	end
		end
	end
end