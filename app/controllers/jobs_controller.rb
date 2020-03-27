#require 'rack-flash'

class JobsController < ApplicationController
  

  # GET: /jobs
  get "/jobs" do
    redirect_if_not_logged_in
    @vacations = Job.all
    erb :"/jobs/index"
  end

  # GET: /jobs/new
  get "/jobs/new" do
    redirect_if_not_logged_in
    erb :"/jobs/new"
  end

  # POST: /jobs
  post "/jobs" do
    redirect_if_not_logged_in
      if params[:company_name] == "" || params[:title] == "" || params[:salary] == "" || params[:description] == "" || params[:location] == ""
        flash[:message]= "All fields are required.  Please try again."
        redirect to "/jobs/new"
      else 
        @job = current_user.jobs.new(title: params[:title], description: params[:description], salary: params[:salary], location: params[:location], company_name: params[:company_name])
      end
      
      if @job.save
        redirect to "/jobs/#{@job.id}"
      else
        flash[:message]= "Error creating job listing.  Please try again."
        redirect to "/jobs/new"
      end
  end

  # GET: /jobs/5
  get "/jobs/:id" do
    redirect_if_not_logged_in
      @job = Job.find_by_id(params[:id])
      erb :"/jobs/show"
    end

  # GET: /jobs/5/edit
  get "/jobs/:id/edit" do
    redirect_if_not_logged_in
    @job = Job.find_by_id(params[:id])
    if @job && @job.user == current_user
      erb :"/jobs/edit"
    else
      flash[:message] = "You can only edit listings posted by you."
      redirect to "/jobs"
    end 
  end

  # PATCH: /jobs/5
  patch "/jobs/:id" do
    redirect_if_not_logged_in
    if params[:company_name] == "" || params[:description] == "" || params[:title] == "" || params[:salary] == "" || params[:location] == ""
      redirect to "/jobs/#{params[:id]}/edit"
    else
      @job = Job.find_by_id(params[:id])
    end
    
    if @job && @job.user == current_user
      if @job.update(company_name: params[:company_name], description: params[:description], title: params[:title], salary: params[:salary], location: params[:location])
        redirect to "/jobs/#{@job.id}"
      else
        redirect to "/jobs/#{@job.id}/edit"
      end
    else
      redirect to "/jobs"
    end
  end

  # DELETE: /jobs/5/delete
  delete "/jobs/:id/delete" do
    redirect_if_not_logged_in
    @job = Job.find_by_id(params[:id])
    if @job && @job.user == current_user
      @job.delete
    else
      flash[:message] = "You can only delete listings posted by you."
    end
      redirect to "/jobs"
  end
end
