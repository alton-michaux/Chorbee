# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chore, type: :model do
  subject do
    Chore.new(job: 'Trash', description: 'Empty cans', child_ids: 1)
  end
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
    # byebug
    expect(subject.children).to_not be_empty
  end
end
