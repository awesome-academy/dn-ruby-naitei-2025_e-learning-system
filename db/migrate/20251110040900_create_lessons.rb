class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|

      t.references :course_module, null: false, foreign_key: { on_delete: :cascade }

      t.string :title, limit: 200, null: false

      t.text :description

      t.string :video_url

      t.string :attachment_url

      t.integer :order_index, default: 1

      t.timestamps
    end
  end
end
