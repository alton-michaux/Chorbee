require 'faker'

FactoryBot.define do
  factory :parent_data do |f|
    f.name { Faker::Name.first_name }
    f.email { Faker::Internet.email }
    f.password { Faker::Lorem.characters(number: 6) }

    f.children do
      FactoryBot.create_list(:child_data, 2)
    end
  end
end
