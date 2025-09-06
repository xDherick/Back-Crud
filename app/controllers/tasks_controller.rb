class TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy ]

  def index
    @tasks = Task.order(created_at: :desc)
    render json: @tasks, include: :comments
  end

  def show
    render json: @task, include: :comments
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      ActionCable.server.broadcast("tasks_channel", @task.as_json(include: :comments))
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      ActionCable.server.broadcast("tasks_channel", @task.as_json(include: :comments))
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    ActionCable.server.broadcast("tasks_channel", { id: @task.id, deleted: true })
    @task.destroy!
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:nome, :inicio, :conclusao, :custo_estimado, :status)
    end
end