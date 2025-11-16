class AddUniqueIndexToQuizQuestions < ActiveRecord::Migration[7.0]
  def change
    add_index :quiz_questions, [:quiz_id, :question_id], unique: true
  end
end
