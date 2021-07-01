# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :appointment do |f|
    f.start_time { Faker::Date.in_date_period(year: 2021, month: 6) }
    f.frequency { Faker::Lorem.word }
    f.done? { Faker::Boolean.boolean(true_ratio: 0.5) }

    association :chore, factory: :chore
  end
end
