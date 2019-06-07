# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Tags', type: :request do
  describe 'Postman integration tests' do
    before(:each) do
      task_one = create(:task, id: 1)
      create(:tag_today).tasks << task_one

      task_two = create(:task, id: 2)
      create(:tag, title: 'Urgent').tasks << task_two
      create(:tag, title: 'Home').tasks << task_two
    end

    context 'GET /v1/tags' do
      it 'matches example' do
        get api_v1_tags_path

        expect(response).to have_http_status(200)
        expect(parse_json(response.body)).to eq(parse_json(file_fixture('v1/postman_get_tags_response.json').read))
      end
    end

    context 'GET /v1/tags/1' do
      it 'matches example' do
        get api_v1_tag_path(1), params: { id: 1 }

        expect(response).to have_http_status(200)
        expect(parse_json(response.body)).to eq(parse_json(file_fixture('v1/postman_get_tags_1_response.json').read))
      end
    end

    context 'POST /v1/tags' do
      it 'matches example' do
        post api_v1_tags_path, params: parse_json(file_fixture('v1/postman_post_tags_request.json').read)

        expect(response).to have_http_status(201)
        expect(parse_json(response.body)).to eq(parse_json(file_fixture('v1/postman_post_tags_response.json').read))
      end
    end

    context 'PATCH /v1/tags/2' do
      it 'matches example' do
        patch api_v1_tag_path(2), params: parse_json(file_fixture('v1/postman_post_tags_2_request.json').read)

        expect(response).to have_http_status(200)
        expect(parse_json(response.body)).to eq(parse_json(file_fixture('v1/postman_post_tags_2_response.json').read))
      end
    end
  end
end
