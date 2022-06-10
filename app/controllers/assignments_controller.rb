class AssignmentsController < ApplicationController

  # def new
  #   @assignment = Assignment.new
  # end

  def create
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @assignment = Assignment.new(user: @user, task: @task)
    @assignment.save
    redirect_to task_path(@task, anchor: "top-of-list")
  end

  def destroy
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @task.users.delete(@user)
    redirect_to task_path(@task, anchor: "top-of-list")
  end

  private

  def assignment_params
    params.require(:assignment).permit(:user_id, :task_id)
  end

end
