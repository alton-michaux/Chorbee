# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chore, type: :model do
  subject { Chore.create(job: 'Trash', description: 'Empty cans', children: FactoryBot.create(:child)) }
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
