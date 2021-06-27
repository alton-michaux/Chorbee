# frozen_string_literal: true

FactoryBot.define do
  factory :chore do |f|
    f.job { Faker::Job.field }
    f.description { Faker::Job.title }

    # factory :chore_with_child do
    #   before(:create) do
    #     child = create(:child)
    #     f.child_ids << child[:id]
    #     f.child_ids.reload
    #   end
    # end

    association :children, factory: :child
  end
end
