class JobsController < ApplicationController
  def create
    job = Job.create!(task: params[:task])
     ProcessJob.perform_later(job.id)  # async call
    render json: { id: job.id, status: job.status }, status: :accepted
  end

  def show
    job = Job.find(params[:id])
    render json: job
  end
end