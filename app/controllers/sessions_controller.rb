class SessionsController < ApplicationController
  require 'jwt'

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or @user
      else
        message = "Account not activated."
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def create_with_api
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      if @user.activated?
        payload = { email: params[:email], password: params[:password] }
        @token = JWT.encode payload, Rails.application.secrets.secret_token_key, 'HS256'
        render "authed"
      else
        render json: { message: "Please check email." }
      end
    else
      render "unauthed"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
