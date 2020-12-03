class FuncionarioSerializer < ActiveModel::Serializer
  attributes :cpf, :nome, :sexo, :telefone, :datanasc, :email
end
