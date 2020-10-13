class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.column(:body, :string)
      t.column(:survey_id, :integer)
      t.timestamps
    end
  end
end
