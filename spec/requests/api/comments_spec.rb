RSpec.describe "POST /api/comments", type: :request do
  let!(:article) { create(:article) }

  let!(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: "application/json" }.merge!(credentials) }

  describe "successfully" do
    before do
      post "/api/comments",
           params: {
             article: article.id,
           },
           headers: headers
    end

    it "should respond with 200 status" do
      expect(response.status).to eq 200
    end

    it "should respond with success message" do
      expect(response_json["message"]).to eq "Thanks for your comment"
    end

    it "should respond with article_body" do
      expect(response_json).to have_key "body"
    end
  end
end
