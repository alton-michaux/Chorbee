# frozen_string_literal: true

require 'rails_helper'
require 'ice_cube'
require 'simple_calendar'

RSpec.describe Appointment, type: :model do
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
  context 'schedule' do
    it 'should have an associated schedule' do
      expect(subject.schedule).to_not be_nil
    end
    it 'should return a IceCube::Schedule object' do
      expect(subject.schedule).to be_an_instance_of(IceCube::Schedule)
    end
    it 'should have a start time' do
      expect(subject.schedule(:start_time)).to_not be_nil
    end
    it 'should have an end time' do
      expect(subject.schedule(:end_time)).to_not be_nil
    end
    it 'should have recurrence rules' do
      expect(subject.schedule(:all_recurrence_rules)).to_not be_nil
    end
  end
  context 'can calendar events' do
    it 'has a calendar_events method that returns an array' do
      expect(subject.calendar_events(Time.now)).to be_an_instance_of(Array)
    end
    it 'returns an array with expected values' do
      expected_array = subject.calendar_events(Time.now)
      expect(subject.calendar_events(Time.now)).to eq(expected_array)
    end
  end
end
