# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parent, type: :model, focus: true do
  subject { FactoryBot.create(:parent) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is only valid with a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is only valid with an email address' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
