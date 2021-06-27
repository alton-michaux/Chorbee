# frozen_string_literal: true

json.extract! appointment, :id, :start_time, :chore_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
