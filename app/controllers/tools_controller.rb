class ToolsController < ApplicationController
  helper_method :most_recent_tool

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to tool_path(@tool.id)
    else
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_path
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save #if passes validations
      flash[:notice] = "Tool created!!!"
      session[:most_recent_tool_id] = Tool.last.id
      redirect_to @tool # same as tool_path(@tool.id); calls show
    else
      render :new
    end
  end

private

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end
end
