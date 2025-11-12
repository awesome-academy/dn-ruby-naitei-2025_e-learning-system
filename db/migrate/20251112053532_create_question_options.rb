class CreateQuestionOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :question_options do |t|
      t.references :question, null: false, foreign_key: true, on_delete: :cascade
      t.text :option_text, null: false
      t.boolean :is_correct, default: false
      t.integer :option_order, default: 1

      t.timestamps
    end
  end
end
