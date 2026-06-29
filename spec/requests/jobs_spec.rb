
RSpec.describe "Jobs API", type: :request do
  describe "POST /jobs" do
    it "creates a job" do
      post "/jobs",
           params: { task: "Generate Report" }
      expect(response).to have_http_status(:accepted)
    end
  end
  # Fetch job details
  describe "GET /jobs/:id" do
    it "returns job details" do
        job = Job.create!(
        task: "Test",
        status: "pending"
        )

        get "/jobs/#{job.id}"

        expect(response).to have_http_status(:ok)
    end
  end
end