class CommentsController < ApplicationController
  before_action :set_task

  def create
    @comment = @task.comments.new(comment_params)

    if @comment.save
      ActionCable.server.broadcast("tasks_channel", @task.as_json(include: :comments))
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

def destroy
  @comment = @task.comments.find(params[:id])
  @comment.destroy
  ActionCable.server.broadcast("tasks_channel", @task.as_json(include: :comments))
  head :no_content # Retorna uma resposta de sucesso sem corpo
end

  private
    def set_task
      @task = Task.find(params[:task_id])
    end

    def comment_params
      params.require(:comment).permit(:author, :content)
    end
end