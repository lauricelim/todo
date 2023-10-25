class CreateTodoTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_tasks do |t|
      t.integer :order, unique: true
      t.text :task
      t.references :user
      
      t.timestamps
    end
  end
end
