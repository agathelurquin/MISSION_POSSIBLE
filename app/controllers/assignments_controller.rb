class AssignmentsController < ApplicationController

  def new
    @assignment = Assignment.new
  end

  def create
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @assignment = Assignment.new(@user, @task)

    if @assignment.save
      redirect_to project_task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(:user_id, :task_id)
  end

end
