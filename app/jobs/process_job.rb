class ProcessJob < ApplicationJob
  queue_as :default

  def perform(job_id)
    job = Job.find(job_id)

    job.update(status: "processing")

    # Simulate work
    sleep(5)

    job.update(status: "completed", result: "Task completed successfully")
  end
end
