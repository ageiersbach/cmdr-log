class CmdrsController < ApplicationController
  def index
    @cmdrs = Cmdr.all
    session[:current_cmdr_id] = nil
  end

  def show
    current_commander = Cmdr.find(params[:id])
    session[:current_cmdr_id] = current_commander.id
  end
end
