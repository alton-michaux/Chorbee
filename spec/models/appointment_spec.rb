# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  child = Child.create(name: 'Aron', age: 14)
  subject do
    Appointment.create(start_time: Date.today, frequency: 'weekly',
                       chore: Chore.create(job: 'Room', description: 'Clean up',
                                           child_ids: [child.id]))
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is only valid with a start time' do
    subject.start_time = ' '
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
