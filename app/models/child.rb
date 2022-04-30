class Child < ApplicationRecord
  validates :name, presence: true
  validates :age,  presence: true
  validates :age, numericality: { only_integer: true }

  validates_associated :parent

  has_and_belongs_to_many :chores, dependent: :destroy
  belongs_to :parent

  def pluck(*args)
    self.pluck(*args)
  end

  # RSPEC(test) methods

  def each; end
end
