class AddMultipleAnswersBoolean < ActiveRecord::Migration
  def change
    add_column(:questions, :multi_answer, :boolean)
  end
end
