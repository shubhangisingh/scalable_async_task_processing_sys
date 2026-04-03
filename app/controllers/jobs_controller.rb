class JobsController < ApplicationController
  def create
    job = Job.create!(task: params[:task])
    render json: { id: job.id, status: job.status }, status: :accepted
  end

  def show
    job = Job.find(params[:id])
    render json: job
  end
end