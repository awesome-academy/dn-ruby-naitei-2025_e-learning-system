class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.references :course, null: false, foreign_key: true, on_delete: :cascade
      t.references :lesson, null: false, foreign_key: true, on_delete: :cascade # (Thêm FK cho lesson)

      t.string :title, limit: 200, null: false
      t.text :description
      t.integer :total_questions, default: 10
      t.integer :time_limit
      t.references :creator, null: true, foreign_key: { to_table: :users }, on_delete: :nullify
      t.integer :pass_score, default: 70
      t.boolean :random_mode, default: true

      t.timestamps
    end
  end
end
