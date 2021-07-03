# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :chore do |f|
    f.job { Faker::Lorem.words }
    f.description { Faker::Lorem.sentence }

    factory :chore_with_child do
      before(:created) do |chore|
        chore.children { [FactoryBot.create_list(:child, 5)] }
        chore.child_ids << chore.children.to_ary
        chore.association :children, factory: :child
      end
    end
  end
end
