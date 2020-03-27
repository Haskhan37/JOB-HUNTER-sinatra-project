class UsersController < ApplicationController

  get "/signup" do
    if !is_logged_in?
      erb :"/users/signup"
    else
      redirect to "/jobs"
    end
  end

  post "/signup" do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "You must provide a username, email and password.  Please try again."
      redirect to "/signup"
    elsif !(User.find_by(username: params[:username]) || User.find_by(email: params[:email]))
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to "/jobs"
    else
      flash[:message] = "Username or email address already assigned to an account.  Please enter a unique username and email address."
      redirect to '/signup'
    end
  end

  get "/login" do
    if !is_logged_in?
      erb :"/users/login"
    else
      redirect to "/jobs/jobs"
    end
  end

  post "/login" do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/jobs"
    else
      flash[:message] = "Invalid username or password.  Please try again."
      redirect to '/login'
    end
  end

  get "/logout" do
    if is_logged_in?
      session.destroy
      redirect to "/"
    else
      redirect to "/"
    end
  end

end
