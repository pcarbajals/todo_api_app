# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Tasks', type: :request do
  describe 'Postman integration tests' do
    before(:each) do
      task = create(:task_wash_laundry)
      task.tags << create(:tag_today)
    end

    context 'GET /v1/tasks' do
      let(:json_response) { parse_json file_fixture('v1/postman_get_tasks_response.json').read }

      it 'matches example' do
        get api_v1_tasks_path

        expect(response).to have_http_status(200)
        expect(parse_json response.body).to eq(json_response)
      end
    end

    context 'POST /v1/tasks' do
      let(:json_request) { parse_json file_fixture('v1/postman_post_tasks_request.json').read }
      let(:json_response) { parse_json file_fixture('v1/postman_post_tasks_response.json').read }

      it 'matches example' do
        post api_v1_tasks_path, params: json_request

        expect(response).to have_http_status(201)
        expect(parse_json response.body).to eq(json_response)
      end
    end

    context 'PATCH /v1/tasks/2' do
      let(:json_request) { parse_json file_fixture('v1/postman_post_tasks_2_request.json').read }
      let(:json_response) { parse_json file_fixture('v1/postman_post_tasks_2_response.json').read }
      let(:task_id) { json_request['data']['id'] }

      it 'matches example without tags' do
        create(:task_wash_laundry, id: task_id)

        patch api_v1_task_path(task_id), params: json_request

        expect(response).to have_http_status(200)
        expect(parse_json response.body).to eq(json_response)
      end

      let(:json_request_with_tag) { parse_json file_fixture('v1/postman_post_tasks_2_with_tag_request.json').read }
      let(:json_response_with_tag) { parse_json file_fixture('v1/postman_post_tasks_2_with_tag_response.json').read }
      let(:task_id) { json_request_with_tag['data']['id'] }

      it 'matches example with tags' do
        create(:task_wash_laundry, id: task_id)

        patch api_v1_task_path(task_id), params: json_request_with_tag

        expect(response).to have_http_status(200)
        expect(parse_json response.body).to eq(json_response_with_tag)
      end
    end
  end
end
