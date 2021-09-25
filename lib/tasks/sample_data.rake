# frozen_string_literal: true

require 'factory_bot'

module Seeds
  class SampleData
    def self.run
      FactoryBot.create(:parent_data)
    end
  end
end
