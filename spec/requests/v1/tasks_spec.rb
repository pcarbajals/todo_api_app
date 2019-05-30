require 'rails_helper'

RSpec.describe 'V1::Tasks', type: :request do
  describe 'GET /v1/tasks' do
    let(:json_response) { parse_json file_fixture('v1/postman_get_tasks_response.json').read }

    it 'matches Postman example' do
      get v1_tasks_path

      expect(response).to have_http_status(200)
      expect(parse_json response.body).to eq(json_response)
    end
  end

  describe 'POST /v1/tasks' do
    let(:json_request) { parse_json file_fixture('v1/postman_post_tasks_request.json').read }
    let(:json_response) { parse_json file_fixture('v1/postman_post_tasks_response.json').read }

    it 'matches Postman example' do
      post v1_tasks_path, params: json_request

      expect(response).to have_http_status(200)
      expect(parse_json response.body).to eq(json_response)
    end
  end
end
