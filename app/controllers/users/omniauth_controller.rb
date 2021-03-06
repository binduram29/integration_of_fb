class Users::OmniauthController < ApplicationController
	# facebook callback
	def facebook
	  @user = User.create_from_provider_data(request.env['omniauth.auth'])
	  if @user.persisted?
	    sign_in_and_redirect @user
	    flash[:success] = 'User got created.'
	    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	    p "user got created................"
	  else
	    flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
	    redirect_to new_user_registration_url
	  end 
	end

	# google callback
	def google_oauth2
		# binding.pry
	  @user = User.create_from_provider_data(request.env['omniauth.auth'])
	  if @user.persisted?
	    sign_in_and_redirect @user
	    p "111111111111111111111111111111111111111"
	    flash[:success] = 'User got created.'
	    # set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
	  else
	    flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
	    redirect_to new_user_registration_url
	  end 
	end

	# twitter callback
	def twitter
		# binding.pry
	  @user = User.create_from_twitter_provider_data(request.env['omniauth.auth'])
	  if @user.persisted?
	  	binding.pry
	    sign_in_and_redirect @user
	    p "twitter..................."
	    # set_flash_message(:notice, :success, kind: 'Twitter') if is_navigational_format?
	  else
	    flash[:error] = 'There was a problem signing you in through Twitter. Please register or try signing in later.'
	    redirect_to new_user_registration_url
	  end 
	end

	def failure
	  flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
	  redirect_to new_user_registration_url
	end
end
