# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'validations and associations' do
    it { should validate_presence_of :title }
    it { should have_and_belong_to_many :tags }
  end

  context 'on initialization' do
    it 'should accept tags of type Tags' do
      tags = [Tag.new(title: 'tag 1'), Tag.new(title: 'tag 2')]
      task = Task.create!(title: 'tags as Tags', tags: tags)

      expect(task.tags.count).to eq(2)
      expect(task.tags.map(&:title)).to eq(['tag 1', 'tag 2'])
    end

    it 'should accept tags of type Strings' do
      strings = ['tag 1', 'tag 2']
      task    = Task.create!(title: 'tags as Strings', tags: strings)

      expect(task.tags.count).to eq(2)
      expect(task.tags.map(&:title)).to eq(['tag 1', 'tag 2'])
    end

    it 'should raise an error for tags of unknown type' do
      integers = [1, 2]
      expect { Task.create!(title: 'tags as Integers', tags: integers) }.to raise_error(ArgumentError)
    end

    after(:all) do
      Task.destroy_all
      Tag.destroy_all
    end
  end
end
