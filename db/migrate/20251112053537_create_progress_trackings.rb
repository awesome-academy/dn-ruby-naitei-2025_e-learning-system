class CreateProgressTrackings < ActiveRecord::Migration[7.0]
  def change
    create_table :progress_trackings do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :course, null: false, foreign_key: true, on_delete: :cascade
      t.references :lesson, null: true, foreign_key: true, on_delete: :nullify
      t.references :quiz, null: true, foreign_key: true, on_delete: :nullify

      t.string :progress_type, null: false
      t.string :status, default: 'not_started'
      t.decimal :progress_value, precision: 5, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
