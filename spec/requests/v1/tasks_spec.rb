require 'rails_helper'

RSpec.describe 'V1::Tasks', type: :request do
  describe 'Postman integration tests' do
    context 'GET /v1/tasks' do
      let(:json_response) { parse_json file_fixture('v1/postman_get_tasks_response.json').read }
  
      it 'matches example' do
        get v1_tasks_path
  
        expect(response).to have_http_status(200)
        expect(parse_json response.body).to eq(json_response)
      end
    end
  
    context 'POST /v1/tasks' do
      let(:json_request) { parse_json file_fixture('v1/postman_post_tasks_request.json').read }
      let(:json_response) { parse_json file_fixture('v1/postman_post_tasks_response.json').read }
  
      it 'matches example' do
        post v1_tasks_path, params: json_request
  
        expect(response).to have_http_status(200)
        expect(parse_json response.body).to eq(json_response)
      end
    end
  
    context 'PATCH /v1/tasks/2' do
      let(:json_request) { parse_json file_fixture('v1/postman_post_tasks_2_request.json').read }
      let(:json_response) { parse_json file_fixture('v1/postman_post_tasks_2_response.json').read }
  
      it 'matches example' do
        post v1_tasks_path, params: json_request
  
        expect(response).to have_http_status(200)
        expect(parse_json response.body).to eq(json_response)
      end
    end
  end
end
