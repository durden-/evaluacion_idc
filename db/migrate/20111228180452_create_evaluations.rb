class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.string :incident
      t.integer :user_id
      t.string :clarify
      t.boolean :pregunta_uno
      t.boolean :pregunta_dos
      t.boolean :pregunta_tres
      t.boolean :pregunta_cuatro
      t.text :notes

      t.timestamps
    end
  end
end
