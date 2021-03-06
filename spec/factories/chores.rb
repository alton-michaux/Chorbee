require 'faker'

FactoryBot.define do
  factory :chore do |f|
    f.job { Faker::Lorem.word }
    f.description { Faker::Lorem.sentence }
    f.child_ids do
      FactoryBot.create_list(:child, 3).pluck('id')
    end
  end
end
