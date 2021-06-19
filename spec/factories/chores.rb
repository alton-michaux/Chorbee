# frozen_string_literal: true

FactoryBot.define do
  factory :chore do |f|
    f.job { Faker::Job.field }
    f.description { Faker::Job.title }
    f.child_ids { Faker::Number.unique.number(digits: 2) }

    association :children, factory: :child
  end
end
