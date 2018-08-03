class CommandersController < ApplicationController
  before_action :authenticate_commander!

  def show
    @commander = current_commander
  end
end
