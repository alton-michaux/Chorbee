# frozen_string_literal: true

class ChildSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :chore_id
end
