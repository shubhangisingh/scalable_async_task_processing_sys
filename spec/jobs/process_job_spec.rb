require 'rails_helper'

RSpec.describe ProcessJob, type: :job do
    include ActiveJob::TestHelper

  it "processes the job successfully" do
    job = Job.create!(task: "Test", status: "pending")

    ProcessJob.perform_now(job.id)

    expect(job.reload.status).to eq("completed")

    # job.reload

    # expect(job.status).to eq("completed")
  end

  it "enqueues a job" do
    expect {
      ProcessJob.perform_later(1)
    }.to have_enqueued_job(ProcessJob)
  end
end