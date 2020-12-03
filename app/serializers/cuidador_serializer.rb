class CuidadorSerializer < ActiveModel::Serializer
  attributes :cpf, :nome, :sexo, :telefone, :datanasc, :email
end
