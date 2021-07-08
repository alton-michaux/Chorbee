# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :chore do |f|
    f.job { Faker::Lorem.words }
    f.description { Faker::Lorem.sentence }

    before(:create) do |chore|
      chore.children { [FactoryBot.create(:child)] }
    end
  end
end
