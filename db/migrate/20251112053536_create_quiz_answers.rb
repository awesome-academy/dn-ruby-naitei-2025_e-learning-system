class CreateQuizAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_answers do |t|
      t.references :quiz_attempt, null: false, foreign_key: true, on_delete: :cascade
      t.references :question, null: false, foreign_key: true, on_delete: :cascade
      t.references :question_option, null: true, foreign_key: true, on_delete: :nullify

      t.json :selected_option_ids # Dùng JSON để lưu mảng [1, 2, 3]
      t.boolean :is_correct, default: false
      t.datetime :answered_at
    end
  end
end
