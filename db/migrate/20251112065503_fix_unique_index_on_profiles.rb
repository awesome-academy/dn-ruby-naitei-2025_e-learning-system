# db/migrate/20251112065503_fix_unique_index_on_profiles.rb
class FixUniqueIndexOnProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :profiles, :users

    remove_index :profiles, :user_id, name: "index_profiles_on_user_id"

    add_index :profiles, :user_id, unique: true

    add_foreign_key :profiles, :users, on_delete: :cascade
  end
end
