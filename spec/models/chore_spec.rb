require 'rails_helper'

RSpec.describe Chore, type: :model do
  subject { FactoryBot.create(:chore) }
  it 'is valid with valid attributes' do
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
    subject.child_ids = ' '
    expect(subject).to_not be_valid
  end
  it 'is only valid with a valid child' do
    expect(subject.children).to_not be_nil
  end
end
