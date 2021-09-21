# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :parent do |f|
    f.name { Faker::Name.first_name }
    f.email { Faker::Internet.email }
    f.password { Faker::Lorem.characters(number: 6) }

    f.children do
      FactoryBot.create_list(:child, 2)
    end
  end
end
