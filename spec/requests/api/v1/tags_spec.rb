require 'rails_helper'

RSpec.describe 'Api::V1::Tags', type: :request do
  describe 'Postman integration tests' do
    before(:each) do
      task_one = create(:task, id: 1)
      task_two = create(:task, id: 2)

      tag_today = create(:tag_today)
      tag_today.tasks << task_one

      tag_urgent = create(:tag, title: 'Urgent')
      tag_urgent.tasks << task_two

      tag_home = create(:tag, title: 'Home')
      tag_home.tasks << task_two
    end

    context 'GET /v1/tags' do
      let(:json_response) { parse_json file_fixture('v1/postman_get_tags_response.json').read }

      it 'matches example' do
        get api_v1_tags_path

        expect(response).to have_http_status(200)
        expect(parse_json response.body).to eq(json_response)
      end
    end

    context 'POST /v1/tags' do
      let(:json_request) { parse_json file_fixture('v1/postman_post_tags_request.json').read }
      let(:json_response) { parse_json file_fixture('v1/postman_post_tags_response.json').read }

      it 'matches example' do
        post api_v1_tags_path, params: json_request

        expect(response).to have_http_status(201)
        expect(parse_json response.body).to eq(json_response)
      end
    end

    context 'PATCH /v1/tags/2' do
      let(:json_request) { parse_json file_fixture('v1/postman_post_tags_2_request.json').read }
      let(:json_response) { parse_json file_fixture('v1/postman_post_tags_2_response.json').read }
      let(:tag_id) { json_request['data']['id'] }

      it 'matches example' do
        # create(:task_wash_laundry, id: task_id)

        patch api_v1_tag_path(tag_id), params: json_request

        expect(response).to have_http_status(200)
        expect(parse_json response.body).to eq(json_response)
      end
    end
  end
end
