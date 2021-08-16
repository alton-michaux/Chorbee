# frozen_string_literal: true

class Child < ApplicationRecord
  validates :name, presence: true
  validates :age,  presence: true
  validates :age, numericality: { only_integer: true }

  validates_associated :parent

  has_and_belongs_to_many :chores, dependent: :destroy
  belongs_to :parent

  # RSPEC(test) methods

  def each; end
end
