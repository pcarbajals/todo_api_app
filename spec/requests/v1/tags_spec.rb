require 'rails_helper'

RSpec.describe 'V1::Tags', type: :request do
  describe 'GET /v1/tags' do
    let(:json_response) { parse_json file_fixture('v1/postman_get_tags_response.json').read }

    it 'matches example' do
      get v1_tags_path

      expect(response).to have_http_status(200)
      expect(parse_json response.body).to eq(json_response)
    end
  end

  context 'POST /v1/tags' do
    let(:json_request) { parse_json file_fixture('v1/postman_post_tags_request.json').read }
    let(:json_response) { parse_json file_fixture('v1/postman_post_tags_response.json').read }

    it 'matches example' do
      post v1_tags_path, params: json_request

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

      patch v1_tag_path(tag_id), params: json_request

      expect(response).to have_http_status(200)
      expect(parse_json response.body).to eq(json_response)
    end
  end
end
