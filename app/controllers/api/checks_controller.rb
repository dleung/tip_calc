class Api::ChecksController < Api::BaseController
  def index
    respond_with :api, Task.all
  end
 
  def show
    respond_with :api, Task.find(params[:id])
  end

  def create
    respond_with :api, Task.create(task_params)
  end
 
  def update
    respond_with :api, Task.update(params[:id], task_params)
  end
 
  def destroy
    respond_with :api, Task.destroy(params[:id])
  end

  private

  # Rails 4 Strong Parameters
  def task_params
    params.require(:task).permit(:description, :title)
  end
end