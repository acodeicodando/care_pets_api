class PetAdoptionSerializer < ActiveModel::Serializer
  attributes :id, :adopted_by, :adopted_at
end
