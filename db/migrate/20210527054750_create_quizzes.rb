class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.text :title,      null: false
      t.text :answer,     null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
