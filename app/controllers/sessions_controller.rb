class SessionsController < ApplicationController
    before_action :logged_in_path, only: [:new, :create]
    
    def new
    
    end    
    
    def create
     user =  User.find_by(Username: params[:session][:username])
     if user && user.authenticate(params[:session][:password])
         session[:user_id] = user.id
         cookies.signed[:user_id] = user.id
         flash[:success] = "Successfully logged in"
         redirect_to root_path
    else
        flash.now[:error] = "There was a problem"
        render 'new'
    end
    end    
    
     def destroy
        session[:user_id] = nil
       redirect_to login_path
       flash[:success] = "You have logged out"
    end
  
   def logged_in_path
       if logged_in?
         flash.now[:error] = "You are already logged in"
         redirect_to root_path
       end
   end       
end