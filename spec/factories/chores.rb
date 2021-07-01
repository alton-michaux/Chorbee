# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :chore do |f|
    f.job { Faker::Lorem.words }
    f.description { Faker::Lorem.sentence }

    association :children, factory: :child

    after(:create) do |chore|
      chore.children = FactoryBot.create_list(:child, 2, chore: chore)
    end

  end
end
