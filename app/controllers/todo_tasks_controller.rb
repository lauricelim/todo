class TodoTasksController < ApplicationController
  def index
    render json: current_user.todo_tasks.order(:order)
  end

  def create
    latest = current_user.todo_tasks.order(:order).last
    todo = current_user.todo_tasks.new(
      task: params[:task],
      order: latest ? latest.order + 1 : 1,
    )
    if todo.save
      render json: todo
    else
      render json: {error: todo.errors}, status: 500
    end
  end

  def show
    todo = TodoTask.find(params[:id])
    if todo
      render json: todo
    else
      render json: {error: todo.error}, status: 404
    end
  end

  def update
    todo = TodoTask.find(params[:id])
    if todo.update(task: params[:task])
      render json: todo
    else
      render json: {error: todo.error}, status: 500
    end
  end

  def destroy
    todo = TodoTask.find(params[:id])
    if todo.destroy
      render json: {success: true}
    else
      render json: {error: todo.error}, status: 500
    end
  end

  private

  # Assuming user is always User1
  def current_user
    User.find_by(name: "User1")
  end

end
