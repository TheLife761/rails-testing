class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
  
    if @task.save
      flash[:notice] = 'Tarea creada exitosamente'
      redirect_to tasks_path
    else
      flash.now[:alert] = 'Error al crear la tarea'  
      render :new  
    end
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = 'Tarea actualizada exitosamente'
      redirect_to task_path(@task)
    else
      flash.now[:alert] = 'Error al actualizar la tarea'  
      render :edit  
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = 'Tarea eliminada exitosamente'  
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
