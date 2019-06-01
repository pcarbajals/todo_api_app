# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'validations and associations' do
    it { should validate_presence_of :title }
    it { should have_and_belong_to_many :tasks }
  end
end
