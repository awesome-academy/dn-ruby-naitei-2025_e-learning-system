class CreateQuizAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_attempts do |t|
      t.references :quiz, null: false, foreign_key: true, on_delete: :cascade
      t.references :user, null: false, foreign_key: true, on_delete: :cascade

      t.datetime :started_at
      t.datetime :finished_at
      t.decimal :score, precision: 5, scale: 2
      t.boolean :is_passed, default: false
      t.string :status, default: 'in_progress'
      t.integer :duration_seconds

      # (SQL của bạn không có t.timestamps ở đây, nên ta bỏ qua)
    end
  end
end
