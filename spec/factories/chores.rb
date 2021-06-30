# frozen_string_literal: true

FactoryBot.define do
  factory :chore do |f|
    f.job { Faker::Job.field }
    f.description { Faker::Job.title }

    association :children, factory: :child
  end
end
