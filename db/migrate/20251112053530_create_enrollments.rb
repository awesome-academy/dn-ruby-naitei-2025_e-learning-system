class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :course, null: false, foreign_key: true, on_delete: :cascade

      t.timestamp :enrolled_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.boolean :status, default: 1

      t.timestamps
    end
    add_index :enrollments, [:user_id, :course_id], unique: true
  end
end
