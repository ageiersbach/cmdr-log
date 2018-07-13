class CommandersController < ApplicationController
  #before_action :authenticate_commander!

  def index ; end

  def show
    authenticate_commander!
    @commander = Commander.find(params[:id])
  end
end
