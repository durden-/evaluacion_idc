class CreateEvaluacions < ActiveRecord::Migration
  def change
    create_table :evaluacions do |t|
      t.string :incidente
      t.integer :user_id
      t.string :clarify
      t.boolean :pregunta_uno
      t.boolean :pregunta_dos
      t.boolean :pregunta_tres
      t.boolean :pregunta_cuatro
      t.text :comentarios

      t.timestamps
    end
  end
end
