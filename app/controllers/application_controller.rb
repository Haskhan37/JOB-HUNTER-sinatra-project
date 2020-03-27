require './config/environment'
require 'sinatra/flash'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "jobhunter"
    register Sinatra::Flash
  end

  get "/" do
    erb :'/users/index'
  end

  helpers do
    def current_user
      @user = User.find_by_id(session[:user_id])
    end

    def is_logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      if !is_logged_in?
        flash[:message] = "You must be logged in to view or post new job listings."
        redirect to "/login"
      end
    end
  end

end
