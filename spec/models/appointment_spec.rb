require 'rails_helper'

RSpec.describe Appointment, type: :model, focus: true do
  subject { FactoryBot.create(:appointment) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is only valid with a start_time' do
    subject.start_time = ' '
    expect(subject).to_not be_valid
  end
  it 'is only valid with an end_time' do  
    subject.end_time = ' '
    expect(subject).to_not be_valid
  end
  it 'is only valid with a chore id' do
    subject.chore_id = ' '
    expect(subject).to_not be_valid
  end
  it 'is only valid with a frequency value' do
    subject.frequency = ' '
    expect(subject).to_not be_valid
  end
  it 'is only valid with a valid chore' do
    expect(subject.chore).to_not be_nil
  end
  it 'is only valid with a valid child' do
    expect(subject.chore.children).to_not be_nil
  end
end
