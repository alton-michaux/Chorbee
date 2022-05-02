require 'faker'

FactoryBot.define do
  factory :child_data do |f|
    f.name { Faker::Name.first_name }
    f.age { Faker::Number.number(digits: 1) }
    f.parent_id { [FactoryBot.create(:parent_data)].pluck('id').join }

    f.chores do
      FactoryBot.create(:chore_data)
    end
  end
end
