require 'rails_helper'
require 'pry'

RSpec.describe Job, type: :model do
  it "is valid with a task" do
    job = Job.new(task: "test_task")
    expect(job).to be_valid
  end

  it "is invalid without a task" do
    job = Job.new(task: nil)
    expect(job).not_to be_valid
  end

  it "sets default status to pending" do
    job = Job.create(task: "test")
    expect(job.status).to eq("pending")
  end

  it "processes job and updates status" do
    job = Job.create(task: "test")

    ProcessJob.perform_now(job.id)

    expect(job.reload.status).to eq("completed")
  end

end