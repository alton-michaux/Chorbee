# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model, focus: true do
  subject do
    Appointment.create(start_time: Date.today, frequency: 'weekly', end_time: Date.today + 30,
                       chore: Chore.create(job: 'Rake', description: 'Rake leaves in yard',
                                           children: Child.create(name: 'Ara', age: 14)))
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is only valid with a start time and end time' do
    subject.start_time = ' '
    expect(subject).to_not be_valid
    # subject.end_time = ' '
    # expect(subject).to_not be valid
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
