class JobsController < ApplicationController
  
  def new
    @job = Job.new
  end
  
  def update
    @job = Job.find(params[:id])
    @job.update_attributes(job_params)
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
    @job = Job.where(:title => params[:job][:title]).first_or_create
    current_user.jobs << @job
  end
  
  private
  
  def job_params
    params.required(:job).permit(:title, :description)
  end
end