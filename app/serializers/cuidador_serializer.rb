class CuidadorSerializer < ActiveModel::Serializer
  attributes :id, :cpf, :nome, :sexo, :telefone, :datanasc, :email
end
