# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :child do |f|
    f.name { Faker::Name.first_name }
    f.age { Faker::Number.number(digits: 1) }
    f.parent_id { [FactoryBot.create(:parent)].pluck('id').join }
  end
end
