class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_of_birth, :pet_type, :slug

  has_one :pet_adoption
end
