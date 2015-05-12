class CreateAnswers < ActiveRecord::Migration
  def change
    create_table(:answers) do |t|
      t.column(:description, :string)
      t.column(:question_id, :int)
    end
  end
end
