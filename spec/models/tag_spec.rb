# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'validations and associations' do
    it { should validate_presence_of :title }
    it { should have_and_belong_to_many :tasks }
    it { should validate_uniqueness_of :title }
    
    it 'should not be associated with the same task more than once' do
      tag = create(:tag_today)
      task = create(:task_wash_laundry)

      task.tags << tag
      expect(task.tags.count).to eq(1)

      expect { task.tags << tag }.to raise_error(ActiveRecord::RecordNotUnique)
      expect(task.tags.count).to eq(1)
    end
  end
end
