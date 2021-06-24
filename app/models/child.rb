# frozen_string_literal: true

class Child < ApplicationRecord
  validates :name, presence: true
  validates :age,  presence: true
  validates :age, numericality: { only_integer: true }

  has_and_belongs_to_many :chores, dependent: :destroy

  def each(&block)
    Chldren.each(&block)
  end
end
