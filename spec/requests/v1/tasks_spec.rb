require 'rails_helper'

RSpec.describe 'V1::Tasks', type: :request do
  describe 'GET /v1/tasks' do
    let(:postman_get_tasks_json_response) { parse_json file_fixture('v1/postman_get_tasks.json').read }

    it 'matches Postman example "Existing Title check"' do
      get v1_tasks_path

      expect(response).to have_http_status(200)
      expect(parse_json response.body).to eq(postman_get_tasks_json_response)
    end
  end
end
