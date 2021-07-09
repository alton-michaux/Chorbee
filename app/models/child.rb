# frozen_string_literal: true

class Child < ApplicationRecord
  validates :name, presence: true
  validates :age,  presence: true
  validates :age, numericality: { only_integer: true }

  has_and_belongs_to_many :chores, dependent: :destroy

  # RSPEC(test) methods

  def each; end

  # def -(*); end

  # def to_ary
  #   as_json.to_a
  # end
end
