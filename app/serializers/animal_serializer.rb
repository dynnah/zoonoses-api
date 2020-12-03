class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :nome, :raca, :sexo, :idade, :peso
  has_one :cuidador
end
