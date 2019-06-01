# frozen_string_literal: true

FactoryBot.define do
  factory :tag, aliases: [:tag_today] do
    title { 'Today' }
  end
end