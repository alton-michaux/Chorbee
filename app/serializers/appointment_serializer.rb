# frozen_string_literal: true

class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :start_time
  has_one :chore_id
end
