class Chore < ApplicationRecord
  validates :job, presence: true
  validates :description, presence: true

  validates :child_ids, presence: true
  validates_each :child_ids, allow_blank: false do |record, attr, value|
    record.errors.add attr, 'not a number' if value.to_s.nil?
  end

  validates_associated :children

  has_one :appointment, dependent: :destroy
  has_and_belongs_to_many :children

  # RSPEC(test) methods

  def each; end
end
