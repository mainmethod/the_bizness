class JobsController < ApplicationController
  
  def new
    @job = Job.new
  end
  
  def update
    @job = Job.find(params[:id])
    @job.update_attributes(params[:job])
    respond_to do |format|
      format.js
    end
  end
  
  def edit
    @job = Job.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  def create
    @job = Job.find_or_create_by_title(params[:job][:title])
    current_user.jobs << @job
  end
end