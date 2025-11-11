class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.references :category, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.string :thumbnail_url
      t.bigint :created_by

      t.timestamps
    end

    add_foreign_key :courses, :users, column: :created_by, on_delete: :nullify
  end
end
