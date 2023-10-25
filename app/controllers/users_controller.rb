class UsersController < ApplicationController
  
  def update_todo_order
    binding.pry
    if current_user.update(todo_task_params)
      render json: current_user.todo_tasks
    else
      render json: {error: todo.error}, status: 500
    end
  end

  private

  # Assuming user is always User1
  def current_user
    User.find_by(name: "User1")
  end

  def todo_task_params
    params.permit(todo_tasks_attributes: %i[id order])
  end

end
