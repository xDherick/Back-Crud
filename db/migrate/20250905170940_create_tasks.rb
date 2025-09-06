class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :nome
      t.date :inicio
      t.date :conclusao
      t.decimal :custo_estimado
      t.string :status

      t.timestamps
    end
  end
end
