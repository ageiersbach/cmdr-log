class TokenController < ApplicationController
  before_action :authenticate_commander!

  def index
    @commander = current_commander
  end

  def create
    @commander = current_commander
    if @commander.regenerate_token
      flash[:success] = "Token generated"
      redirect_to "index"
    end
  end

end
