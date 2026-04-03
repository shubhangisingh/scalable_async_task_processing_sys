require 'rails_helper'

RSpec.describe ProcessJob, type: :job do
  it "processes job and updates status" do
    job = Job.create(task: "test_task")

    ProcessJob.perform_now(job.id)

    job.reload

    expect(job.status).to eq("completed")
    expect(job.result).to eq("Task completed successfully")
  end
end