# frozen_string_literal: true

module API
  module V1
    class Base < Grape::API
      mount API::V1::Children
    end
  end
end