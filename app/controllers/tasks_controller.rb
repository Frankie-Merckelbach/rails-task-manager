class TasksController < ApplicationController

  #read all
  def index
    @tasks = Task.all
  end

 #read one
  def show
    @task = Task.find(params[:id])
  end

  #create
  def new
    @task = Task.new
  end

  #create and POST the form
  def create
    @task = Task.new(tasks_params)
    @task.save
    # no need for app/views/restaurants/create.html.erb
    redirect_to task_path(@task)
  end

  #update step 1, GET FORM
  def edit
    @task = Task.find(params[:id])
  end

  #update step 2, PATCH form
  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end


private
  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end

