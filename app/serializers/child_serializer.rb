class ChildSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :chore_id
end
