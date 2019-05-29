require 'rails_helper'

RSpec.describe 'V1::Tasks', type: :request do
  describe 'GET /v1/tasks' do
    it 'works! (now write some real specs)' do
      get v1_tasks_path
      expect(response).to have_http_status(200)
    end
  end
end
