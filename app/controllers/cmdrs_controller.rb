class CmdrsController < ApplicationController
  def index
    @cmdrs = Cmdr.all
    session[:current_cmdr_id] = nil
  end

  def show
    current_commander = Cmdr.find(params[:id])
    session[:current_cmdr_id] = current_commander.id
  end

  def new
    @cmdr = Cmdr.new
  end

  def create
    @cmdr = Cmdr.new(cmdr_params)
    if @cmdr.save
      redirect_to @cmdr
    else
      render :new
    end
  end

  private

  def cmdr_params
    params.require(:cmdr).permit(:name)
  end
end
