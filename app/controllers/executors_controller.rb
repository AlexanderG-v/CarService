class ExecutorsController < ApplicationController
  before_action :set_executor, only: %i[show edit update destroy]

  def index
    @executors = Executor.all
  end

  def show; end

  def new
    @executor = Executor.new
  end

  def create
    @executor = Executor.new(executor_params)

    if @executor.save
      redirect_to @executor
    else
      render :new
    end
  end

  def edit; end

  def update
    if @executor.update(executor_params)
      redirect_to @executor
    else
      render :edit
    end
  end

  def destroy
    @executor.destroy

    redirect_to executors_path
  end

  private

  def set_executor
    @executor = Executor.find(params[:id])
  end

  def executor_params
    params.require(:executor).permit(:name)
  end
end
