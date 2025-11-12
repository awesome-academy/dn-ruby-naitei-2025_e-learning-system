class CreateQuizQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_questions do |t|
      t.references :quiz, null: false, foreign_key: true, on_delete: :cascade
      t.references :question, null: false, foreign_key: true, on_delete: :cascade
      t.integer :order_index, default: 1

      t.timestamps
    end
  end
end
