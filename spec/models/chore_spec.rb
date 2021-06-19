# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chore, type: :model do
  subject do
    FactoryBot.create(:child, name: 'Jerry', age: 13, id: 2)
    FactoryBot.create(:chore, job: 'trash', description: 'empty trashcans', child_ids: [2])
  end
  it 'is valid with valid attributes', focus: true do
    expect(subject).to be_valid
  end
  it 'is only valid with a job' do
    subject.job = nil
    expect(subject).to_not be_valid
  end
  it 'is only valid with a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  it 'is only valid with a child id' do
    subject.child_ids = nil
    expect(subject).to_not be_valid
  end
end
