class JobsController < ApplicationController

  def index
    @jobs = JobPost.all
  end

  def show
    @job = JobPost.find(params[:id])
  end

  def update
  end

  def create
  end

  def edit
  end

  def destroy
  end

end
