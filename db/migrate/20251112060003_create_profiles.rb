class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }, unique: true

      t.text :bio
      t.string :phone, limit: 20
      t.string :gender

      t.date :dob
      t.timestamps
    end
  end
end
