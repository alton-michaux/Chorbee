require 'faker'

FactoryBot.define do
  factory :chore do |f|
    f.job { Faker::Lorem.words }
    f.description { Faker::Lorem.sentence }
    f.children { [FactoryBot.create(:child)] }
  end
end
