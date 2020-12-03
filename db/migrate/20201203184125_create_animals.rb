class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :nome
      t.string :raca
      t.string :sexo
      t.integer :idade
      t.float :peso
      t.references :cuidador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
