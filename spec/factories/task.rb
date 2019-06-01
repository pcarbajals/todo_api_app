# frozen_string_literal: true

FactoryBot.define do
  factory :task, aliases: [:task_wash_laundry] do
    title { 'Wash laundry' }
  end
end