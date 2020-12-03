class CreateCuidadors < ActiveRecord::Migration[6.0]
  def change
    create_table :cuidadors do |t|
      t.string :cpf
      t.string :nome
      t.string :sexo
      t.string :telefone
      t.date :datanasc
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
