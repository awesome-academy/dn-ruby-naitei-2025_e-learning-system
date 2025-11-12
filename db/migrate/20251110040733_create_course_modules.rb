class CreateCourseModules < ActiveRecord::Migration[7.0]
  def change
    create_table :course_modules do |t|

      t.references :course, null: false, foreign_key: { on_delete: :cascade }

      t.string :title, limit: 200, null: false

      t.text :description

      t.integer :order_index, default: 1

      t.timestamps
    end
  end
end
