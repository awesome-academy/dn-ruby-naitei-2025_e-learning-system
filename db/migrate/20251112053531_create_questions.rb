class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :course, null: true, foreign_key: true, on_delete: :nullify
      t.references :lesson, null: true, foreign_key: true, on_delete: :nullify

      t.text :question_text, null: false
      t.string :question_type, default: 'single'
      t.string :difficulty, default: 'medium'

      t.references :creator, null: true, foreign_key: { to_table: :users }, on_delete: :nullify

      t.timestamps
    end
  end
end
