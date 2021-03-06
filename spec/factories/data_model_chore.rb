require 'faker'

FactoryBot.define do
  factory :chore_data do |f|
    f.job { Faker::Lorem.word }
    f.description { Faker::Lorem.sentence }
    f.appointment do
      FactoryBot.create(:appointment)
    end
    f.child_ids do
      FactoryBot.create_list(:child_data, 3).pluck('id')
    end
  end
end
